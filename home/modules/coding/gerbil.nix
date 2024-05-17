{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.programming.gerbil.enable {
    home.packages = with pkgs; [
      gerbil
    ];
  };

  options.jo1gi.programming.gerbil = {

    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

  };
}
