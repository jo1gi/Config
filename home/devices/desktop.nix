{ config, ... }:

{
  imports = [
    ../home.nix
    ../modules/temporary/compilers.nix
  ];

  config.jo1gi = {
    general.enable = true;
    windowmanager.enable = true;
  };
}
