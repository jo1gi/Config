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
        "file:///home/jo1gi/Documents/Books"
        "file:///home/jo1gi/Documents"
        "file:///home/jo1gi/Downloads"
        "file:///home/jo1gi/Games"
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

    iconTheme = {
      name = "Oomox-gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
    };
  };

}
