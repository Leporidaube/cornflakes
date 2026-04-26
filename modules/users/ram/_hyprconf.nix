  # modules/users/ram/_hyprconf.nix 

  { inputs, pkgs, config, lib, ... }:
{

  # dotfiles (hyprland) - live editable
#  xdg.configFile."hypr/hyprland.conf".source =
#    config.lib.file.mkOutOfStoreSymlink "/home/ram/ramdots/hyprland.conf";
#  xdg.configFile."hypr/UserConfigs".source =
#    config.lib.file.mkOutOfStoreSymlink "/home/ram/ramdots/UserConfigs";
#  xdg.configFile."hypr/UserScripts".source =
#    config.lib.file.mkOutOfStoreSymlink "/home/ram/ramdots/UserScripts";

  # dotfiles (hyprland) - symlinked
#  xdg.configFile."hypr/hyprland.conf".source = "${inputs.ramdots}/hyprland.conf";
#  xdg.configFile."hypr/UserConfigs".source = "${inputs.ramdots}/UserConfigs";
#  xdg.configFile."hypr/UserScripts".source = "${inputs.ramdots}/UserScripts";

#  # keybinds (hyprland)
#  xdg.configFile."hypr/hyprland.conf".text = ''
#    bind = SUPER, Return, exec, kitty 
#    bind = super, Q, killactive,
#    bind = SUPER, M, exit
#    bind = SUPER, 1, workspace, 1
#    bind = SUPER, 2, workspace, 2
#    bind = SUPER, 3, workspace, 3
#    bind = SUPER, 4, workspace, 4
#    bind = SUPER, 5, workspace, 5
#    bind = SUPER, 6, workspace, 6
#    bind = SUPER, 7, workspace, 7
#    bind = SUPER, 8, workspace, 8
#    bind = SUPER, 9, workspace, 9
#  '';

}
