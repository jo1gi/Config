{ config, pkgs, lib, ... }:

{
  config.services.xserver.displayManager = {
    autoLogin = {
      user = "jo1gi";
      enable = true;
    };
    lightdm = {
      greeters = {
        gtk = {
          enable = true;
        };
      };
    };
  };
}
