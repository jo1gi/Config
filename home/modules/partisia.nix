{ pkgs, lib, ... }:

{
  config = lib.mkIf config.jo1gi.partisia.enable {

    home.packages = with pkgs; [
      jetbrains.idea-ultimate
      watchman
      maven
    ];

    jo1gi.programming = {
      java = {
        enable = true;
        jdk = pkgs.jdk17;
      };
      nodejs.enable = true;
      rust = {
        enable = true;
        useRustup = true;
      };
    };
  };

  options.jo1gi.partisia.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };
}
