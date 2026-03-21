  # modules/hosts/koch/koch.nix

  { config, inputs, ... }:
{
  flake.nixosConfigurations.sier = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.modules.nixos; [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      { networking.hostName = "koch"; }
      ram
      boot
      store
      audio           
      bluetooth
      wifi 
      print
      portable
      i18n
      hyprland
      system-packages
      games
      extras
    ];
  };
}
