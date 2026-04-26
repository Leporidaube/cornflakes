  # modules/users/ram/_fonts

  { inputs, pkgs, config, lib, ... }:
{
  let
    tewi-nerd = pkgs.tewi-font.overrideAttrs (o: {
      nativeBuildInputs = (o.nativeBuildInputs or []) ++ [ pkgs.nerd-font-patcher ];
      postInstall = ''
        mkdir -p $out/share/fonts/truetype/tewi-nerd
        for f in $out/share/fonts/truetype/*.ttf; do
          nerd-font-patcher --complete --outputdir $out/share/fonts/truetype/tewi-nerd/ $f
        done
      '';
    });
  in
  {
    home.packages = [ tewi-nerd ];

    programs.kitty = {
      enable = true;
      font = {
        name = "Tewi Nerd Font Mono";
        size = 11;
      };
    };
  } 
}
