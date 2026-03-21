  # modules/hosts/koch/portable.nix

  { ... }: 
{
  flake.modules.nixos.portable = { ... }: {

    # Touchpad support 
    services.libinput.enable = true;

    # Battery status 
    services.upower.enable = true;

    # Suspend
    services.logind.lidSwitch = "suspend";
    powerManagement.enable = true;
  };
}

