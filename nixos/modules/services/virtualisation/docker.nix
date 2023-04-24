{ config, pkgs, lib, ... }:

{
  config = {
    virtualisation.docker = {
      enable = true;
      enableOnBoot = false;
    };
    users.users.jo1gi.extraGroups = [ "docker" ];
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
