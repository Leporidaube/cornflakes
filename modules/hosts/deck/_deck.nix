# modules/hosts/deck/deck.nix

  { config, inputs, ... }:
{
  flake.nixosConfigurations.deck = inputs.nixpkgs.lib.nixosSystem {

    specialArgs = {
      inherit inputs;
      inherit (inputs.nixpkgs) lib;
    };

    modules = with config.flake.modules.nixos; [

      # host
      ./_hardware-configuration.nix
      boot
 
      # jovian
      inputs.jovian.nixosModules.default

      { 
        networking.hostName = "deck";
        system.stateVersion = "25.11";

        jovian = {
          devices.steamdeck.enable = true;
          steam = {
            enable = true;
            autoStart = true;
            user = "ram";
            desktopSession = "hyprland";
          };
        };
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
      hypr

      # cloud sync
      syncthing 

      # packages
      system-packages
      games
      waydroid
      emulation
      emacs   

    ];
  };
}
