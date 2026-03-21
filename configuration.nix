# Hi! If you're reading this, you've sucessfully migrated to NixOS :D
# This directory will grow with you.
# Learn as much as you can, and have fun!
# ram : 03-18-26

# Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
# However, therapy is not.

{ config, lib, pkgs, inputs, ... }:

{
  imports = [ 
      # Hardware scan
      ./host/hardware-configuration.nix
      # System configuration
      ./host/system-configuration.nix
      # Network services 
      ./host/network-configuration.nix
      # User configuration
      ./user/users.nix
      # Desktop environment
      ./environment/environment.nix
      # Package configuration
      ./packages/packages.nix
      # Home manager
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Automatic storage optimization
  
  # Periodic optimization
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "07:00" ];

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 8d";
  };

  # NixOS no-no square

  # Whatever you do, do not change this. It will break your system.
  system.stateVersion = "25.11"; 
}

