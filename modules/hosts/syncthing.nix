  # modules/hosts/syncthing.nix

  { ... }:
{
  flake.modules.nixos.syncthing = { ... }: {
    services.syncthing = {
      enable = true;
      user = "ram";
      dataDir = "/home/ram";
      configDir = "/home/ram/.config/syncthing";
      openDefaultPorts = true;
    };
  };
}
