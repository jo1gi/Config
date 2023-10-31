{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.programs.duf.enable {

    home.packages = [
      pkgs.duf
    ];



  };

  options.programs.duf = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
