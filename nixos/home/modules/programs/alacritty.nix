{ config, ... }:

with config.jo1gi; {
  programs.alacritty = {
    settings = {
      window = {
        title = "Alacritty";
        padding = {
          x = terminal.margin;
          y = terminal.margin;
        };
        dynamic_title = true;
        opacity = terminal.opacity;
      };

      cursor.style = terminal.cursor;

      font = {
        normal.family = terminal.font;
        size = terminal.fontsize;
      };

      colors = with config.lib.base16.theme; {
        primary.background = "0x${base00-hex}";
        primary.foreground = "0x${base05-hex}";

        cursor.text = "0x${base00-hex}";
        cursor.cursor = "0x${base05-hex}";

        normal = {
          black = "0x${base00-hex}";
          red = "0x${base08-hex}";
          green = "0x${base0B-hex}";
          yellow = "0x${base0A-hex}";
          blue = "0x${base0D-hex}";
          magenta = "0x${base0E-hex}";
          cyan = "0x${base0C-hex}";
          white = "0x${base05-hex}";
        };

        bright = {
          black = "0x${base03-hex}";
          red = "0x${base09-hex}";
          green = "0x${base01-hex}";
          yellow = "0x${base02-hex}";
          blue = "0x${base04-hex}";
          magenta = "0x${base06-hex}";
          cyan = "0x${base0F-hex}";
          white = "0x${base07-hex}";
        };
      };
    };
  };
}
