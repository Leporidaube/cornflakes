  # modules/users/ram/_spicetify.nix 

  { inputs, pkgs, config, lib, ... }:
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

    # spicetify
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
#      {
#        src = pkgs.fetchFromGitHub {
#          owner = "ivLis-Studio";
#          repo = "ivLyrics";
#          rev = "main";
#          hash = "sha256-R/w5YvCp1Yg/BIxbi6RoTAPtL0372hZ+kzYpnCY/Scu=";
#        };
#        name = "ivLyrics";
#      }
    ];

    enabledExtensions = with spicePkgs.extensions; [
      adblock               # adblockify
      wikify                # wikify
      listPlaylistsWithSong # list playlists with songs
      volumePercentage      # volume percentage
      shuffle               # shuffle+
      playlistIcons         # playlist icons
      betterGenres          # better spotify genres
      #lastfm                # lastfm stats
      aiBandBlocker         # ai band blocker
      beautifulLyrics       # beautiful lyrics
      romajiConvert         # convert japanese
      hidePodcasts          # hide podcasts
      sideHide              # hide sidebar scrollbar / side panel
      pinnedSidebarPanel    # queue top side panel
    ];
  };
}
