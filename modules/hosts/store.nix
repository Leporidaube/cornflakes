  # modules/hosts/store.nix

  { ... }:
{
  flake.modules.nixos.store = { pkgs, ... }: {

    # Enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Automatic storage optimization
    nix.optimise.automatic = true;
    nix.optimise.dates = [ "07:00" ];

    # Garbage collection
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 8d";
    };

    # Enable dynamic executables
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        icu
        openssl
        zlib
        libGL
        vulkan-loader
        SDL2
      ];
    };
  };
}

