# Awesomewm config
{ config, pkgs, lib, ... }:

{
  config = lib.mkIf (config.personal.desktop == "awesome") {
    # General things for window managers
    home-manager.users.jo1gi.config.personal.windowmanager.enable = true;
    # Compositor
    services.picom.enable = true;
    users.users.jo1gi.packages = with pkgs; [
      # Application launcher
      rofi
    ];

    # Enable awesome
    services.xserver = {
      enable = true;

      desktopManager.xterm.enable = false;
      windowManager.awesome.enable = true;

      displayManager = {
        defaultSession = "none+awesome";
        lightdm.enable = true;
      };
    };
  };
}
