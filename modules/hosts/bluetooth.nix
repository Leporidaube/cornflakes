  # modules/hosts/bluetooth.nix

  { pkgs, ... }:
{
  flake.modules.nixos.bluetooth = { pkgs, ... }: {

    hardware = {
      bluetooth.enable = true;
      bluetooth.settings = {
        General = {
          Experimental = false;
        };
      };
    };

  };
}
