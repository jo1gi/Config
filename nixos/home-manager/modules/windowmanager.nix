{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.personal.windowmanager.enable {
    personal = {
      terminal.enable = true;
    };

    programs = {
      alacritty.enable = true;
      mpv.enable = true;
    };

    home.packages = with pkgs; [
      sxiv
      zathura
      pamixer
      pulsemixer
    ];
  };

  options.personal.windowmanager.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };
}
