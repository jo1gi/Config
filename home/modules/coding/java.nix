{ config, pkgs, lib, ... }:

let
  cfg = config.jo1gi.programming.java;
in
{
  config = lib.mkIf cfg.enable {

    home.packages = with pkgs; [
      gradle
      gradle-completion
      jdt-language-server
      cfg.jdk
      (lib.mkIf cfg.enableMaven maven)
    ];

    home.sessionVariables = {
      JAVA_HOME="${cfg.jdk}";
    };

    programs.neovim = {
      plugins = with pkgs.vimPlugins; [
        nvim-jdtls
      ];
    };

    home.shellAliases = {
      spotless = lib.mkIf cfg.enableMaven "mvn spotless:apply";
      maven-chech-dependencies = lib.mkIf cfg.enableMaven "mvn org.apache.maven.plugins:maven-enforcer-plugin:3.0.0:enforce -Drules=dependencyConvergence,requireUpperBoundDeps";
    };

    home.file."${config.home.homeDirectory}/.local/bin/maven-dependency-search" = lib.mkIf cfg.enableMaven {
      source = ./scripts/maven-dependency-search.sh;
      executable = true;
    };

  };

  options.jo1gi.programming.java = {

    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    jdk = lib.mkOption {
      type = lib.types.package;
      default = pkgs.jdk;
    };

    enableMaven = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
