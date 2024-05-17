{ config, pkgs, lib, ... }:

let
  cfg = config.jo1gi.programming.java;
  ifMavenEnabled = lib.mkIf cfg.maven.enable;
in
{
  config = lib.mkIf cfg.enable {

    home.packages = with pkgs; [
      gradle
      gradle-completion
      jdt-language-server
      cfg.jdk
      (ifMavenEnabled maven)
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
      spotless = ifMavenEnabled "mvn spotless:apply";
      maven-chech-dependencies = ifMavenEnabled "mvn org.apache.maven.plugins:maven-enforcer-plugin:3.0.0:enforce -Drules=dependencyConvergence,requireUpperBoundDeps";
    };

    home.file = {
      "${config.home.homeDirectory}/.local/bin/maven-dependency-search" = ifMavenEnabled {
        source = ./scripts/maven-dependency-search.sh;
        executable = true;
      };
      "${config.home.homeDirectory}/.mvn/maven.config" = ifMavenEnabled {
        text = builtins.concatStringsSep "\n" cfg.maven.options;
      };
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

    maven = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      options = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
      };
    };
  };
}
