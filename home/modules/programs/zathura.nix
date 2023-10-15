{ config, ... }:

{
  config.programs.zathura = {
    options = with config.lib.base16.theme; {
      recolor = true;
      # Theme
      default-bg =              "#${base00-hex}";
      default-fg =              "#${base01-hex}";
      statusbar-bg =            "#${base04-hex}";
      statusbar-fg =            "#${base02-hex}";
      inputbar-bg =             "#${base00-hex}";
      inputbar-fg =             "#${base07-hex}";
      notification-bg =         "#${base00-hex}";
      notification-fg =         "#${base07-hex}";
      notification-error-bg =   "#${base00-hex}";
      notification-error-fg =   "#${base08-hex}";
      notification-warning-bg = "#${base00-hex}";
      notification-warning-fg = "#${base08-hex}";
      highlight-color =         "#${base0A-hex}";
      highlight-active-color =  "#${base0D-hex}";
      completion-bg =           "#${base01-hex}";
      completion-fg =           "#${base0D-hex}";
      completion-highlight-fg = "#${base07-hex}";
      completion-highlight-bg = "#${base0D-hex}";
      recolor-lightcolor =      "#${base00-hex}";
      recolor-darkcolor =       "#${base06-hex}";
    };
  };
}
