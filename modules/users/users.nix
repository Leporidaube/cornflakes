  # modules/users/users.nix

{ inputs, ... }:
let
  mkUser = { username, wheel ? false, autologin ? false }: 
  let
    homePath = ./${username}/_home.nix;
    hasHome = builtins.pathExists homePath;
  in {
    users.users.${username} = {
      isNormalUser = true;
      description = username;
      extraGroups = [ "networkmanager" ] ++ (if wheel then [ "wheel" ] else []);
    };
    services.getty.autologinUser = if autologin then username else null;
    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
      backupFileExtension = "bak";
      extraSpecialArgs = { inherit inputs; };
    } // (if hasHome then { users.${username} = import homePath; } else {});
  };

  # ┌─────────────┐
  # │  User list  │
  # └─────────────┘

  wheel-users = [
    { username = "ram"; autologin = true; }
  ];

  normal-users = [
    # { username = "guest"; }
  ];

  allUsers =
    map (u: mkUser (u // { wheel = true; })) wheel-users ++
    map mkUser normal-users;

in
{
  flake.modules.nixos.users = { lib, ... }:
    lib.mkMerge allUsers;
}
