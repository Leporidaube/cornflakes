  # modules/packages/end4.nix
  
  { ... }:
{
  flake.modules.nixos.end4 = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
    
      # Audio
      cava
      lxqt.pavucontrol-qt
      playerctl
      libdbusmenu-gtk3
      
      # Backlight
      brightnessctl
      ddcutil
      
      # Basic
      bc
      cliphist
      curl
      ripgrep
      jq
      xdg-user-dirs
      rsync
      yq-go
      
      # Fonts
      rubik
      google-fonts
      twemoji-color-font
      material-symbols
      nerd-fonts.jetbrains-mono
      
      # Hyprland extras
      hyprsunset
      wl-clipboard
      
      # Portals
      gnome-keyring
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      
      # File manager
      nautilus
      
      # Python env
      uv
      gtk4
      libadwaita
      gobject-introspection
      
      # Screen capture
      hyprshot
      slurp
      swappy
      tesseract
      wf-recorder
      
      # Toolkit
      wtype
      ydotool
      
      # Widgets
      fuzzel
      glib
      imagemagick
      hypridle
      hyprlock
      hyprpicker
      songrec
      translate-shell
      wlogout
      libqalculate
      
      # Qt/Quickshell deps
      qt6.qtbase
      qt6.qtdeclarative
      qt6.qt5compat
      qt6.qtimageformats
      qt6.qtmultimedia
      qt6.qtpositioning
      qt6.qtsvg
      qt6.qttools
      qt6.qttranslations
      qt6.qtvirtualkeyboard
      qt6.qtwayland
      kdePackages.kirigami
      kdePackages.kdialog
      kdePackages.syntax-highlighting
    ];

    services.gnome.gnome-keyring.enable = true;
    security.polkit.enable = true;
  };
}
