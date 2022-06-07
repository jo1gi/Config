{ config, pkgs, lib, ... }:

{
  config = lib.mkIf (config.personal.desktop == "plasma") {

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
