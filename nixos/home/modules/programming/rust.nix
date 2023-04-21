{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.programming.rust.enable {

    home.packages = with pkgs; [
      rust-analyzer
      cargo
      rustc
    ];

  };
}
