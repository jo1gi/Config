{ inputs, config, ... }:

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

}