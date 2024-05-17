{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.programming.hy.enable = {
    home.packages = with pkgs; [
      (python3.withPackages(ps: with ps; [
        hy
      ]))
    ];
  };

  options.jo1gi.programming.hy = {

    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

  };
}
