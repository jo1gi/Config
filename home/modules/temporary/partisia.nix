{ pkgs, lib, config, ... }:

{
  config = {

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "idea-ultimate"
    ];

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
}
