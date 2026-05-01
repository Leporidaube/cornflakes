  # modules/packages/games.nix
  
  { ... }:
{
  flake.modules.nixos.games = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;
      gamescopeSession.enable = true;
    };

    # Packages
    environment.systemPackages = with pkgs; [
      gamemode
    ];

    # Steam hardware acceleration
    hardware.graphics = {
      enable = true;
      enable32Bit = true; 
    };

    # Compatibility tools
    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/ram/.steam/root/compatibilitytools.d";
    };
  };
}
