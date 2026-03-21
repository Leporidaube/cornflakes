  # modules/hosts/koch/wifi.nix

  { ... }:
{
  flake.modules.nixos.wifi = { ... }: {
    networking.useDHCP = true;
    networking.networkmanager.enable = true;
    networking.wireless.iwd.enable = true;   
  };
}
