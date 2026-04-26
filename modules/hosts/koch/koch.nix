  # modules/hosts/koch/koch.nix

  { config, inputs, ... }:
{
  flake.nixosConfigurations.koch = inputs.nixpkgs.lib.nixosSystem {

    specialArgs = {
      inherit inputs;
      inherit (inputs.nixpkgs) lib;
    };

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

      # necesities
      users
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

      # sandbox
      vm
      ai

      # packages
      system-packages
      art
      games
      waydroid
      emulation
      emacs

    ];
  };
}
