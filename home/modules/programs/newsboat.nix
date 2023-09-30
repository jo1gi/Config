{ config, pkgs, lib, ... }:

{
  config.programs.newsboat = {
    autoReload = true;
    browser = "${pkgs.tae}/bin/tae";
    extraConfig = ''
      feed-sort-order title
      show-read-feeds no
      confirm-mark-feed-read no

      # Bindings
      bind-key o open-in-browser-and-mark-read
      bind-key j down
      bind-key k up
      macro c set-tag "Combined"

      # Colors
      color background          white   black
      color listnormal          white   black
      color listfocus           magenta black
      color listnormal_unread   green   black
      color listfocus_unread    magenta black  bold
      color info                blue    black  bold
      color article             white   black
    '';
  };
  config.programs.tae.enable = lib.mkIf config.programs.newsboat.enable true;
}
