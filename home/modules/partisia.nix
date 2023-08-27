{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.idea-ultimate
    watchman
    rustup
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
    };
  };
}
