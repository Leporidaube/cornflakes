  # modules/users/ram/home.nix

{ config, pkgs, ... }:

  let username = "ram"; in
{
  imports = [
    ./_hyprconf.nix
    ./_shell.nix
    ./_spicetify.nix
    ./_zen.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    vesktop
    obsidian
    audacious
    audacious-plugins
    anki-bin
  ];

  services.easyeffects = {
    enable = true;
  };
}

