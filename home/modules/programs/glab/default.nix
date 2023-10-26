{ config, pkgs, lib, ... }:

{

  config = lib.mkIf config.programs.glab.enable {

    home.packages = [
      pkgs.glab
    ];

  };

  options.programs.glab = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

}
