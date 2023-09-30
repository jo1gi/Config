{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.programming.nodejs.enable {

    home.packages = with pkgs; [
      nodejs
    ];

  };

  options.jo1gi.programming.nodejs = {

    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

  };
}
