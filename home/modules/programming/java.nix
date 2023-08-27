{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.jo1gi.programming.java.enable {

    home.packages = with pkgs; [
      gradle
      gradle-completion
      jdt-language-server
      config.jo1gi.programming.java.jdk
    ];

    programs.neovim = {
      plugins = with pkgs.vimPlugins; [
        nvim-jdtls
      ];
    };

  };

  options.jo1gi.programming.java = {
    jdk = lib.mkOption {
      type = lib.types.package;
      default = pkgs.jdk;
    };
  };
}
