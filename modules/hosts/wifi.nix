  # modules/hosts/koch/wifi.nix

  { ... }:
{
  flake.modules.nixos.wifi = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      impala
    ];

    networking.networkmanager.enable = true;
    networking.networkmanager.wifi.backend = "iwd";
    
    networking.wireless.enable = false;
    networking.useDHCP = false;
  };
}
