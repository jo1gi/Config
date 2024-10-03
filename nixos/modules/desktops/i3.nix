{ pkgs, ... }:

{
  imports = [
    ../services/displaymanager/lightdm.nix
  ];

  config = {
    services = {
      displayManager = {
        defaultSession = "none+i3";
      };
      xserver = {
        enable = true;
        windowManager.i3 = {
          enable = true;
          package = pkgs.i3-gaps;
        };
        displayManager.lightdm = {
          enable = true;
        };
      };
    };
    users.users.jo1gi.packages = with pkgs; [
      bemenu
      feh
    ];
  };
}

