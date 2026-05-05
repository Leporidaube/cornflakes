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

    shellInitLast = ''
      fish_add_path ~/.config/emacs/bin
    '';

    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }

      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
    ];

    interactiveShellInit = ''

      set -g fish_greeting ""

      set -l cwd (prompt_pwd --full-length-dirs 1)
      set -l git_branch (git branch --show-current 2>/dev/null)
      set -l user (whoami)

      function fish_prompt
        set -l cwd (prompt_pwd --full-length-dirs 1)
        set -l git_branch (git branch --show-current 2>/dev/null)
        set -l user (whoami)

        echo -n (set_color --bold cyan)$user(set_color normal)
        echo -n " λ "
        echo -n (set_color blue)$cwd(set_color normal)
        if test -n "$git_branch"
          echo -n (set_color yellow)" [ $git_branch ]"(set_color normal)
        end
        echo -n " : "
      end
    '';
  };
}
