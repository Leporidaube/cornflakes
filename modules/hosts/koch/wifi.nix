  # modules/hosts/koch/wifi.nix

  { ... }:
{
  flake.modules.nixos.wifi = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      impala
    ];

    networking.useDHCP = true;
    networking.networkmanager.enable = true;
    networking.wireless.iwd.enable = true;   
  };
}
