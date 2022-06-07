{ config, lib, pkgs, ... }:

{
  config = lib.mkIf (config.personal.desktop == "sway") {
    home-manager.users.jo1gi.config.personal.windowmanager.enable = true;
    programs.sway.enable = true;
    services.xserver = {
      enable = true;
      displayManager = {
        defaultSession = "sway";
        lightdm.enable = true;
      };
    };
    users.users.jo1gi.packages = with pkgs; [
      bemenu
    ];
  };
}

