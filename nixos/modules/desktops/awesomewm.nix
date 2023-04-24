# Awesomewm config
{ config, pkgs, lib, ... }:

{
  imports = [
    ../services/displaymanager/lightdm.nix
    ../services/picom.nix
  ];

  config = {
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
