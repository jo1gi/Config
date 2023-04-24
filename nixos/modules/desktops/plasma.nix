{ config, pkgs, lib, ... }:

{
  config = {

    services.xserver = {
      enable = true;
      layout = "dk";

      desktopManager.xterm.enable = false;

      desktopManager.plasma5 = {
        enable = true;
      };

      displayManager = {
        defaultSession = "plasma5";
        sddm.enable = true;
      };
    };
  };
}
