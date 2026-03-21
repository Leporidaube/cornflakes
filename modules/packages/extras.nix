  # modules/packages/extras.nix

  { ... }:
{
  flake.modules.nixos.extras = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
     inkscape-with-extensions
     krita
    ];
  };
}
