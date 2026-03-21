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
      extraSpecialArgs = { inherit inputs; };
      users.${username} = import ./ram-home.nix;
    };
  };
}
