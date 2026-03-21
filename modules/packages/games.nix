  # modules/packages/games.nix
  
  { ... }:
{
  flake.modules.nixos.games = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;
    };

    # Lutris
    environment.systemPackages = with pkgs; [
      lutris
    ];
    # Required for 32-bit games
    hardware.graphics.enable32Bit = true;
  };
}
