{ config, ... }:
{
  config.programs.qutebrowser = {
    settings = {
      editor.command = [ "alacritty" "-e" "nvim" "{file}" ];
      colors = with config.lib.base16.theme; import ./colors.nix;
  };
};
}
