{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.personal.general.enable {
    personal = {
      terminal.enable = true;
      programming.enable = true;
    };

    home.packages = with pkgs; [
      # Applications
      libreoffice
      keepassxc
      thunderbird
      newsboat
      tremc

      # Services
      transmission
    ];
  };

  options.personal.general.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };
}
