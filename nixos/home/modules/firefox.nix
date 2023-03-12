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
      redirector
      sponsorblock
    ];
    profiles = {
      standard = {
        name = "Standard";
        isDefault = true;
        search = {
          default = "DuckDuckGo";
          force = true; # Force replace search file
        };
        settings = {
          # Search
          "browser.search.region" = "DK";
          "browser.urlbar.placeholderName" = "DuckDuckGo";
          # Extensions
          "extensions.pocket.enabled" = false;
          # Misc
          "browser.aboutConfig.showWarning" = false;
          "browser.download.dir" = "${config.home.homeDirectory}/Downloads/Browser";
          "signon.rememberSignons" = false;
          "browser.formfill.enable" = false;
          # Theming
          "browser.compactmode.show" = true; # Compact theme
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org"; # Dark theme
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enable custom css
          # Privacy
          "privacy.resistFingerprinting" = true;
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
