{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.windowmanager.enable {
    jo1gi = {
      terminal.enable = true;
    };

    programs.mpv.enable = true;

    home.packages = with pkgs; [
      sxiv
      zathura
      pamixer
      pulsemixer
    ];
  };

  options.jo1gi.windowmanager.enable = lib.mkOption {
    type = lib.types.bool;
    default = lib.lists.any lib.trivial.id [
      config.wayland.windowManager.sway.enable
      config.xsession.windowManager.i3.enable
    ];
  };
}
