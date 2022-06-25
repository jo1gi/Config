{ config, ... }:

with config.personal; {
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

      colors = with config.colorScheme.colors; {
        primary.background = "0x${base00}";
        primary.foreground = "0x${base05}";

        cursor.text = "0x${base00}";
        cursor.cursor = "0x${base05}";

        normal = {
          black = "0x${base00}";
          red = "0x${base08}";
          green = "0x${base0B}";
          yellow = "0x${base0A}";
          blue = "0x${base0D}";
          magenta = "0x${base0E}";
          cyan = "0x${base0C}";
          white = "0x${base05}";
        };

        bright = {
          black = "0x${base03}";
          red = "0x${base09}";
          green = "0x${base01}";
          yellow = "0x${base02}";
          blue = "0x${base04}";
          magenta = "0x${base06}";
          cyan = "0x${base0F}";
          white = "0x${base07}";
        };
      };
    };
  };
}
