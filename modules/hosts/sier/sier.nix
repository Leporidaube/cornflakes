  # modules/hosts/sier/sier.nix

  { config, inputs, ... }:
{
  flake.nixosConfigurations.sier = inputs.nixpkgs.lib.nixosSystem {

    specialArgs = {
      inherit inputs;
      inherit (inputs.nixpkgs) lib;
    };

    modules = with config.flake.modules.nixos; [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      { networking.hostName = "sier"; }
      ram
      boot
      store
      audio
      bluetooth
      ethernet
      print
      i18n
      hyprland
      system-packages
      games
      extras
      easyeffects
    ];
  };
}
