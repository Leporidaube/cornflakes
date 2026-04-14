  # modules/packages/emacs.nix

{ ... }:
  {
    flake.modules.nixos.emacs = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [

        # The one and only (lies there's so many emacs)
        emacs

        # Doom deps
        git
        ripgrep
        fd
        findutils

        # Language tooling 
        nodejs  # for some Doom modules
        python3
        gcc     # for native compilation

        # Misc
        aspell                    
        aspellDicts.en
        imagemagick               
      ];
    };
  }
