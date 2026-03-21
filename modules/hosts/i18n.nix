  # modules/hosts/i18n.nix

  { ... }:
{
  flake.modules.nixos.i18n = { ... }: {

    # Adds international characters
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
    };

    # Time zone
    time.timeZone = "America/Chicago"; 

    # Right Alt compose ( ~ + n = ñ ) and Caps Lock esc
    services.xserver.xkb.options = "compose:ralt,caps:escape";
  };
}
