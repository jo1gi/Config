{ config, ... }:

{
  imports = [
    ../home.nix
  ];

  config.jo1gi = {
    general.enable = true;
    windowmanager.enable = true;
  };
}
