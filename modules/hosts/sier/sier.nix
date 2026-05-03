  # modules/hosts/sier/sier.nix

  { config, inputs, ... }:
{
  flake.nixosConfigurations.sier = inputs.nixpkgs.lib.nixosSystem {

    specialArgs = {
      inherit inputs;
      inherit (inputs.nixpkgs) lib;
    };

    modules = with config.flake.modules.nixos; [

      # host
      ./_hardware-configuration.nix
      boot

      { 
        networking.hostName = "sier";
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
      audiofix
      bluetooth
      ethernet
      print
      intl

      # desktop environment
      hypr

      # cloud sync
      syncthing

      # sandbox
      vm

      # packages
      system-packages
      games
      vr
      art
      media
      easyeffects
      waydroid
      emacs

    ];
  };
}
