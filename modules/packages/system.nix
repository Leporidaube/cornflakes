  # modules/packages/system.nix

  { ... }:
{
  flake.modules.nixos.system-packages = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [

      # Terminal
      kitty
      fish

      # Git
      wget
      git
      curl

      # Manuals
      man
      wikiman

      # Fallback IDE, files
      vim
      yazi
      zathura
      
      # Utilities
      busybox
      ripgrep
      jq
      uv
      xdg-user-dirs
      rsync
      yq-go
      gobject-introspection
    ];
  };
}
