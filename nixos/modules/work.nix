{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.personal.work.enable {
    # Jsfix config
    virtualisation.docker = {
      enable = true;
      enableOnBoot = false;
    };
    users.users.jo1gi.extraGroups = [ "docker" ];
    environment.systemPackages = with pkgs; [
      docker-compose
      nodejs-16_x
    ];
  };

  options.personal.work.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };
}
