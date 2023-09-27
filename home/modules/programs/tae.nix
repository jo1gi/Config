{ config, lib, inputs, pkgs, ... }:

let
  cfg = config.programs.tae;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.tae
    ];

    # xdg.configFile."tae/tae.toml".text = "";

    programs.tae = {
      rules = [
        {
          host = "twitter.com";
          redirect = "https://nitter.net\${path}";
        }
        {
          host = "youtube.com";
          command = "mpv --speed=2.5";
        }
        {
          scheme = "https";
          command = config.jo1gi.defaults.browser;
        }
      ];
    };
  };

  options.programs.tae = with lib; {

    enable = mkOption {
      type = types.bool;
      default = false;
    };

    rules = mkOption {
      type = types.listOf (types.submodule {
        options = {
          command = mkOption {
            type = types.nullOr types.str;
            default = null;
          };
          host = mkOption {
            type = types.nullOr types.str;
            default = null;
          };
          redirect = mkOption {
            type = types.nullOr types.str;
            default = null;
          };
          scheme = mkOption {
            type = types.nullOr types.str;
            default = null;
          };
        };
      });
    };

  };
}
