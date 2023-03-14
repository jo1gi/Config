{ config, pkgs }:

{
  config.wayland.windowManager.sway = {
    config = {
      keybindings = {

      };
      colors = with config.scheme.withHashtag; {
        focused = {
          background = base0A;
          border = base00; 
          childBorder = base05;
          indicator = base0B;
          text = base0A;
        };
        unfocused = {
          background = base00;
          border = base00; 
          childBorder = base05;
          indicator = base0B;
          text = base00;
        };
      };
      gaps = {
        inner = 10;
        outer = 5;
      };
    };
  };
}
