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
      };
    };
  };
}
