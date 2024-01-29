{ config, ... }:

{
  imports = [
    ../home.nix
    ../modules/temporary/compilers.nix
    ../modules/temporary/dissy.nix
  ];

  config = {
    jo1gi = {
      programming = {
        haxe.enable = true;
        lua.enable = true;
        racket.enable = true;
        nim.enable = true;
        teal.enable = true;
      };
      general.enable = true;
    };
    xsession.windowManager.i3.enable = true;
  };
}
