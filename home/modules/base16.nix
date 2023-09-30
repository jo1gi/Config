{ inputs, config, lib, ... }:

{

  imports = [
    inputs.base16.hmModule
  ];

  config.themes.base16 = {
    enable = true;
    scheme = "gruvbox";
    variant = "gruvbox-dark-medium";
    defaultTemplateType = "default";
    extraParams = {
      fontName = config.jo1gi.terminal.font;
      fontSize = config.jo1gi.terminal.fontsize;
    };
  };

  # options.themes.wallpaper = lib.mkOption {
  #   type = lib.types.path;
  #   default = ../../../dotfiles/.config/wallpapers/gruvbox-dark.png;
  # };

  options.themes.wallpaper = lib.mkOption {
    type = lib.types.str;
    default = "${config.xdg.configHome}/wallpapers/gruvbox-dark.png";
  };

}
