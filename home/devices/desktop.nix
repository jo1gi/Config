{ config, ... }:

{
  imports = [
    ../home.nix
  ];

  config.jo1gi = {
    general.enable = true;
    programming = {
      android.enable = true;
    };
    windowmanager.enable = true;
  };
}
