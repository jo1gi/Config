{ config, ... }:

{
  config.programs.qutebrowser = {
    settings = {
      editor.command = [ "alacritty" "-e" "nvim" "{file}" ];
      colors = import ./colors.nix { theme = config.lib.base16.theme; };
    };
  };
}
