  # modules/environments/greeter.nix

  { ... }:

{
  flake.modules.nixos.greeter = { pkgs, ... }: {
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.hyprland}/bin/hyprland/";
      user = "ram";
    };
  };

    # Prevent login spam in journal
    systemd.services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
  };
}
