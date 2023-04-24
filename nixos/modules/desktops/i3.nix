{ config, lib, pkgs, ... }:

{
  imports = [
    ../services/displaymanager/lightdm.nix
  ];

  config = {
    # home-manager.users.jo1gi.config.personal.windowmanager.enable = true;
    services.xserver = {
      enable = true;
      displayManager = {
        defaultSession = "none+i3";
        lightdm.enable = true;
      };
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };
    users.users.jo1gi.packages = with pkgs; [
      bemenu
      feh
    ];
  };
}

