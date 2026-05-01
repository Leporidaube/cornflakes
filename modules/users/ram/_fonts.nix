  # modules/users/ram/_fonts

let
  gallant = pkgs.stdenvNoCC.mkDerivation {
    name = "gallant-font";
    src = pkgs.fetchFromGitHub {
      owner = "NanoBillion";
      repo = "gallant";
      rev = "main";
      hash = "sha256-UL6pcjRZbVh+dknAXQBuYw1NWFKDeXAShCFtHtHFoMU=";
    };
    installPhase = ''
      mkdir -p $out/share/fonts/truetype
      cp *.ttf $out/share/fonts/truetype/ 2>/dev/null || true
      cp *.otf $out/share/fonts/truetype/ 2>/dev/null || true
    '';
  };
in
{
  home.packages = [ gallant ];
}
