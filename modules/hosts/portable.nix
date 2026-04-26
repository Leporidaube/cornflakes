  # modules/hosts/koch/portable.nix

  { ... }: 
{
  flake.modules.nixos.portable = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      brightnessctl
      ddcutil
    ];

    # Touchpad support 
    services.libinput.enable = true;

    # Battery status 
    services.upower.enable = true;

    # Suspend
    services.logind.settings.Login.HandleLidSwitch = "suspend";
    powerManagement.enable = true;
  };
}

