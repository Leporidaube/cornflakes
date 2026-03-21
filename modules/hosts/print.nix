  # modules/hosts/print.nix

  { ... }: 
{
  flake.modules.nixos.print = { pkgs, ... }: {

    services.printing = {
      enable = true;
    };

    services.avahi = {
      enable = true;
      nssmdns4 = true;
    };

    programs.cups-pdf.enable = true;
  };
}
