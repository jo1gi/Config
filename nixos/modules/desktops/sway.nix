{ config, lib, pkgs, ... }:

{
  imports = [
    ../services/displaymanager/lightdm.nix
  ];

  config = {
    # jo1gi.windowmanager = true;
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

