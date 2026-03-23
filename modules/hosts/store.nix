  # modules/hosts/store.nix

  { ... }:
{
  flake.modules.nixos.store = { ... }: {

    # Enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Enable dynamic executables
    programs.nix-ld.enable = true;

    # Automatic storage optimization
    nix.optimise.automatic = true;
    nix.optimise.dates = [ "07:00" ];

    # Garbage collection
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 8d";
    };
  };
}

