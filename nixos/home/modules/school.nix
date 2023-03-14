{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.personal.school.enable {
    home.packages = with pkgs; [
      # Java
      java-language-server
      jdk
      gradle

      # Tools
      git
    ];
  };

  options.personal.school = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
