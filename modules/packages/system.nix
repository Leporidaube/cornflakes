  # modules/packages/system.nix

  { ... }:
{
  flake.modules.nixos.system-packages = { pkgs, ... }: {

    # enable appimage support
    programs.appimage.enable = true;
    programs.appimage.binfmt = true;

    # allow unfree packages
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [

      # Terminal
      kitty
      fish
      fastfetch

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
      busybox # zip files
      udiskie # automount
      ripgrep # search on steroids
      ripgrep-all # and on stims too
      imagemagick # pretty pictures

    ];
  };
}
