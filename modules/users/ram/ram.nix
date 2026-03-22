  # modules/users/ram/ram.nix

  { inputs, ... }:
  let
    username = "ram";
  in

{
  flake.modules.nixos.ram = { pkgs, ... }: {
    users.users.${username} = {
      isNormalUser = true;
      description = username;
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [ tree ];
    };

    services.getty.autologinUser = username;

    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
      backupFileExtension = "bak";
      extraSpecialArgs = { inherit inputs; };
      users.${username} = import ./_ram-home.nix;
    };
  };
}
