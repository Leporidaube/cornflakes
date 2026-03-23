  # modules/hosts/koch/koch.nix

  { config, inputs, ... }:
{
  flake.nixosConfigurations.sier = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.modules.nixos; [

      # host
      ./_hardware-configuration.nix
      boot

      { 
        networking.hostName = "koch";
        system.stateVersion = "25.11";
      }

      # disko
      ./_disko.nix
      inputs.disko.nixosModules.disko

      # home manager
      inputs.home-manager.nixosModules.default

      # user
      ram

      # necesities
      store
      audio           
      bluetooth
      wifi 
      print
      portable
      i18n

      # desktop environment
      hyprland
      end4

      # packages
      system-packages
      games
      extras

    ];
  };
}
