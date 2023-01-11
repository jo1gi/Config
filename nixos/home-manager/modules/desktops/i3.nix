{ config, ... }:

{
  config = {
    xsession.windowManager.i3 = {
      config = {
        keybindings = {
          let
            terminal = "alacritty";
            browser = "firefox";
            modifier = config.xsession.windowManager.i3.config.modifier;
            menu = builtins.cancatStringSep " " [
              "bemenu-run"
              "--nb '#282828'"
              "--ab '#282828'"
              "--fb '#282828'"
              "--hb '#282828'"
              "--tb '#282828'"
              "--tf '#fabd2f'"
              "--hf '#fabd2f'"
              "-B 0"
            ];
          in
          # Start applications
          "ctrl+mod1+t" = "exec ${terminal}";
          "ctrl+mod1+f" = "exec ${browser}";
          "mod1+space" = "exec ${menu}"

          # Kill window
          "${modifier}+q" = "kill"

          # Audio
          "XF86AudioRaiseVolume" = "exec pamixer --allow-boost -i 5";
          "XF86AudioLowerVolume" = "exec pamixer --allow-boost -d 5";

          # Screen brightness
          "XF86MonBrightnessUp" = "exec light -A 5";
          "XF86MonBrightnessDown" = "exec light -D 5";

          #
        };
      };
    };
  };
}
