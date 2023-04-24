{ config, lib, pkgs, ... }:

let
  terminal = "alacritty";
  browser = "firefox";
  launcher = "dmenu_path | dmenu | xargs swaymsg exec --";
  volumeChange = 2;
  brightnessChange = 2;
  mod = "Mod4";
  swayEnabled = config.wayland.windowManager.sway.enable;
in
  {
    config.wayland.windowManager.sway = {
      config = {
        modifier = "Mod4";
        terminal = terminal;

        keybindings = {
          # Launch applications
          "ctrl+mod1+t" = "exec ${terminal}";
          "ctrl+mod1+f" = "exec ${browser}";
          "mod1+Space" = "exec ${launcher}";

          # Sound
          "XF86AudioRaiseVolume" = "exec pamixer --allow-boost -i ${toString volumeChange}";
          "XF86AudioLowerVolume" = "exec pamixer --allow-boost -d ${toString volumeChange}";

          # Brightness
          "XF86MonBrightnessUp" = "exec light -A ${toString brightnessChange}";
          "XF86MonBrightnessDown" = "exec light -U ${toString brightnessChange}";

          # Layout
          "${mod}+b" = "splith";
          "${mod}+v" = "splitv";
          "${mod}+w" = "layout tabbed";
          "${mod}+e" = "layout toggle split";

          # Window
          "${mod}+q" = "kill";
          "${mod}+f" = "fullscreen";
          "${mod}+t" = "floating toggle";
          "${mod}+s" = "sticky toggle";

          # Scratchpad
          "${mod}+Shift+minus" = "move scratchpad";
          "${mod}+minus" = "scratchpad show";

          # Disable laptop screen
          "${mod}+mod1+l" = "output eDP-1 toggle";

          # Focus
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";
          "${mod}+Left" = "focus left";
          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Right" = "focus right";

          # Move Window
          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";
          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";

          # Switch workspace
          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";

          # Move container to workspace
          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10";

          # Switch relative workspace
          "Ctrl+Mod1+Right" = "workspace next_on_output";
          "Ctrl+Mod1+Left" = "workspace prev_on_output";

          # Sway specific
          "${mod}+Shift+r" = "reload";
          "${mod}+Shift+e" = "swaynag -t warning -m 'Exit Sway' -B 'Yes' 'swaymsg exit'";
        };

        modes = {
          resize = {
            "h" = "resize shrink width 10px";
            "j" = "resize grow height 10px";
            "k" = "resize shrink height 10px";
            "l" = "resize grow width 10px";
            "Left" = "resize shrink width 10px";
            "Down" = "resize grow height 10px";
            "Up" = "resize shrink height 10px";
            "Right" = "resize grow width 10px";

          # Return to default mode
          "Return" = "mode \"default\"";
          "Escape" = "mode \"default\"";
        };
      };

      colors = with config.lib.base16.theme; {
        focused = {
          border = "#${base0A-hex}";
          background = "#${base00-hex}";
          text = "#${base05-hex}";
          indicator = "#${base0B-hex}";
          childBorder = "#${base0A-hex}";
        };
        unfocused = {
          border = "#${base00-hex}";
          background = "#${base00-hex}";
          text = "#${base05-hex}";
          indicator = "#${base0B-hex}";
          childBorder = "#${base00-hex}";
        };
      };

      bars = [{
        position = "top";
        fonts = {
          names = [ "DejaVu Sans Mono" ];
          style = "bold";
          size = 9.0;
        };
        statusCommand = "while date +'%H:%M'; do sleep 60; done";
        colors = with config.lib.base16.theme; {
          background = "#${base00-hex}";
          focusedWorkspace = {
            background = "#${base00-hex}";
            border = "#${base00-hex}";
            text = "#${base0A-hex}";
          };
          inactiveWorkspace = {
            background = "#${base00-hex}";
            border = "#${base00-hex}";
            text = "#${base05-hex}";
          };
          statusline = "#${base05-hex}";
        };
      }];

      gaps = {
        inner = 10;
        outer = 5;
      };

      floating = {
        criteria = [ { window_role = "pop-up"; } ];
      };

      input = {
        "type:keyboard" = {
          xkb_layout = "dk";
          natural_scroll = "disabled";
        };
      };

      output = {
        "*" = { bg = "~/.config/wallpapers/gruvbox-dark.png fill"; };
      };

      window.border = 2;

      assigns = {
        "password" = [{ app_id = "org.keepassxc.KeePassXC"; }];
      };
    };
  };
  config.home.file."${config.home.homeDirectory}/.local/bin/music" = lib.mkIf swayEnabled {
    source = ../../../scripts/sway-music.sh;
    executable = true;
  };
}
