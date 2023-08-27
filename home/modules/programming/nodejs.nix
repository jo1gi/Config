{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.programming.nodejs.enable {

    home.packages = with pkgs; [
      nodejs
    ];
  };
}
