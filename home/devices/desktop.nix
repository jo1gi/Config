{ config, ... }:

{
  imports = [
    ../home.nix
    ../modules/temporary/compilers.nix
  ];

  config = {
    jo1gi = {
      general.enable = true;
    };
    xsession.windowManager.i3.enable = true;
  };
}
