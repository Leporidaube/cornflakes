  # modules/hosts/sier/sier.nix

  { config, inputs, ... }:
{
  flake.nixosConfigurations.sier = inputs.nixpkgs.lib.nixosSystem {

    specialArgs = {
      inherit inputs;
      inherit (inputs.nixpkgs) lib;
    };

    modules = with config.flake.modules.nixos; [
      ./_hardware-configuration.nix
      ./_disko.nix
      inputs.home-manager.nixosModules.default
      inputs.disko.nixosModules.disko
      { 
        networking.hostName = "sier";
        system.stateVersion = "25.11";
      }
      ram
      boot
      store
      audio
      audiofix
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
