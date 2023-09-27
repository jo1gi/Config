{ config, lib, inputs, pkgs, ... }:

let
  cfg = config.programs.tae;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.tae
    ];

    xdg.configFile."tae/tae.toml".text = inputs.toTOML cfg.rules;

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
            type = types.str;
          };
          host = mkOption {
            type = types.str;
          };
          redirect = mkOption {
            type = types.str;
          };
          scheme = mkOption {
            type = types.str;
          };
        };
      })
    };

  };
}
