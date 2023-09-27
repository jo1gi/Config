{ config, lib, pkgs, ... }:

let
  defaults = config.jo1gi.defaults;
  cfg = config.jo1gi.general;
in
{
  config = lib.mkIf cfg.enable {

    jo1gi = {
      terminal.enable = true;
      programming.enable = true;
    };

    programs = {
      alacritty.enable = defaults.terminal == "alacritty";
      firefox.enable = defaults.browser == "firefox";
      newsboat.enable = true;
      thunderbird.enable = true;
    };

    services = {
      mpd.enable = true;
    };

    services.gpg-agent.enable = true;

    home.packages = with pkgs; [
      # Applications
      gimp
      inkscape
      keepassxc
      libreoffice
      tremc
      qbittorrent
    ];
  };

  options.jo1gi = {
    general = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
    defaults = {
      browser = lib.mkOption {
        type = lib.types.enum [
          "firefox"
        ];
        default = "firefox";
      };
      terminal = lib.mkOption {
        type = lib.types.enum [
          "alacritty"
        ];
        default = "alacritty";
      };
    };
  };

}
