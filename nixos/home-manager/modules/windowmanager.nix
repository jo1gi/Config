{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.personal.windowmanager.enable {
    personal = {
      terminal.enable = true;
    };

    programs = {
      mpv.enable;
    };

    home.packages = with pkgs; [
      alacritty
      sxiv
      pamixer
      pulsemixer
    ];
  };

  options.personal.windowmanager.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };
}
