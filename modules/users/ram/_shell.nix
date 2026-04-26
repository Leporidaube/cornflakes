  # modules/users/ram/_shell.nix

  { inputs, pkgs, config, lib, ... }:
{
  # enable bash
  programs.bash = {
    enable = true;
    shellAliases.hi = "Hiii";
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = "1" ]; then
        exec Hyprland
      fi
    '';
    initExtra = ''
      if [[ $- == *i* ]] && [[ -z "$IN_NIX_SHELL" ]]; then
        exec fish
      fi
    '';
  };

  # enable fish 
  programs.fish = {
    enable = true;
  };
}
