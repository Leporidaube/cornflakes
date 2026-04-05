  # modules/packages/system.nix

  { ... }:
{
  flake.modules.nixos.system-packages = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
      wget
      git
      kitty
      man
      wikiman
      yazi
      vim
      busybox
      alejandra
    ];
  };
}
