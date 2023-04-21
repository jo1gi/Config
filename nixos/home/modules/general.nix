{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.general.enable {

    jo1gi = {
      terminal.enable = true;
      programming.enable = true;
    };

    programs = {
      firefox.enable = true;
      thunderbird.enable = true;
    };

    home.packages = with pkgs; [
      # Applications
      gimp
      inkscape
      keepassxc
      libreoffice
      newsboat
      tremc
      qbittorrent
    ];
  };

  options.jo1gi.general.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

}
