  # modules/packages/emulation.nix

{ inputs, ... }:
  { 
    flake.modules.nixos.emulation = { ... }: {      

      # Eden (switch)
      imports = [ inputs.eden.nixosModules.default ];
      programs.eden.enable = true;

    };
  }
