  # modules/hosts/sier/ethernet.nix

  { ... }:
{
  flake.modules.nixos.ethernet = { ... }: {

    # Automatically assign DNS information
    networking.useDHCP = true;

    # NetworkManager 
    networking.networkmanager.enable = true;
  };
}
