{ config, pkgs, lib, ... }:

let
  my-r = pkgs.rstudioWrapper.override {
    packages = with pkgs.rPackages; [
      ggplot2
      dplyr
      xts
    ];
  };
in
{
  config = lib.mkIf config.personal.school.enable {
    home.packages = with pkgs; [
      # Java
      java-language-server
      jdk
      gradle

      # Tools
      git

      # R
      my-r
    ];
  };

  options.personal.school = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
