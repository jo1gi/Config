{ config, pkgs, ... }:

{
  config.gtk = {
    enable = true;

    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    };

    gtk3 = {
      # File manager bookmarks
      bookmarks = [
        "file://${config.home.homeDirectory}/Documents/Books"
        "file://${config.home.homeDirectory}/Documents"
        "file://${config.home.homeDirectory}/Downloads"
        "file://${config.home.homeDirectory}/Games"
      ];

      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };

    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };


    # TODO: Base on base16 theme
    theme = {
      name = "Adwaita-dark";
    };

  };

}
