{ config, ... }:

{
  imports = [
    ../home.nix
  ];

  config.jo1gi.terminal.fontsize = 13;
  config.jo1gi = {
    general.enable = true;
    windowmanager.enable = true;
  };
}
