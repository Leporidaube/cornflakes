  # modules/packages/music.nix

{ ... }:
  {
    flake.modules.nixos.music = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [

      spotdl
      yt-dlp
      ffmpeg
      beets
      kid3

    ];
  };
}
