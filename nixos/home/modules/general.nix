{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.general.enable {
    jo1gi = {
      terminal.enable = true;
      programming.enable = true;
    };

    programs = {
      thunderbird.enable = true;
    };

    home.packages = with pkgs; [
      # Applications
      calibre
      gimp
      inkscape
      keepassxc
      libreoffice
      newsboat
      tremc

      # Other
      jdk

      # Services
      transmission
    ];
  };

  options.jo1gi.general.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };
}
