# vim: ft=nix
{ config, pkgs, lib, ... }:

{
  programs.firefox = {
    enable = true;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      multi-account-containers
      sidebery
      noscript
      ublock-origin
      cookies-txt
      keepassxc-browser
    ];
    profiles = {
      standard = {
        name = "Standard";
        isDefault = true;
        settings = {
          # Search
          "browser.search.region" = "DK";
          "browser.urlbar.placeholderName" = "DuckDuckGo";
          # Extensions
          "extensions.pocket.enabled" = false;
          # Misc
          "browser.aboutConfig.showWarning" = false;
          "browser.download.dir" = "/home/jo1gi/Downloads/Browser";
          # Theming
          "browser.compactmode.show" = true;
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = ''
          #titlebar {
            display: None;
          }
        '';
        bookmarks = {
          # Application interfaces
          "Syncthing" = {
            keyword = "syncthing";
            url = "http://localhost:8384/";
          };
          # Programming
          "Github" = {
            keyword = "github";
            url = "https://github.com";
          };
          "Gitlab" = {
            keyword = "gitlab";
            url = "https://gitlab.com";
          };
          # School
          "Brightspace" = {
            keyword = "brightspace";
            url = "https://brightspace.au.dk/d2l/home";
          };
          "Mit Studie" = {
            keyword = "mitstudie";
            url = "https://mitstudie.au.dk/";
          };
        };
      };
    };
  };
}
