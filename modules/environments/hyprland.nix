  # modules/environments/hyprland.nix

  { ... }:
{
  flake.modules.nixos.hyprland = { pkgs, ... }: {
    programs.hyprland.enable = true;
    services.geoclue2.enable = true;

  programs.dconf.enable = true;

    fonts.packages = with pkgs; [
      rubik
      nerd-fonts.ubuntu
      nerd-fonts.jetbrains-mono
    ];
  };
}
