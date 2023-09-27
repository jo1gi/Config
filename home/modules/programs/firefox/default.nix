{ config, pkgs, lib, ... }:

{
  programs.firefox = {
    profiles = {
      standard = {
        name = "Standard";
        isDefault = true;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          multi-account-containers
          sidebery
          noscript
          ublock-origin
          keepassxc-browser
          sponsorblock
          export-cookies-txt
        ];
        search = {
          default = "DuckDuckGo";
          force = true; # Force replace search file
          engines = {
            "Arch Wiki" = {
              urls = [{
                template = "https://wiki.archlinux.org/index.php";
                params = [
                  { name = "search"; value = "{searchTerms}"; }
                ];
              }];
              definedAliases = [ "!aw" ];
            };
            "Brave Search" = {
              urls = [{
                template = "https://search.brave.com/search";
                params = [
                  { name = "q"; value = "{searchTerms}"; }
                ];
              }];
              iconUpdateURL = "https://cdn.search.brave.com/serp/v2/_app/immutable/assets/apple-touch-icon.5a2b672b.png";
              definedAliases = [ "!b" ];
            };
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "!np" ];
            };
            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "!nw" ];
            };
            "Youtube" = {
              urls = [{
                template = "https://www.youtube.com/results";
                params = [
                  { name = "search_query"; value = "{searchTerms}"; }
                ];
              }];
              iconUpdateURL = "https://www.youtube.com/s/desktop/fa273944/img/favicon_144x144.png";
              definedAliases = [ "!yt" ];
            };
            # Aliases
            "Google".metaData.alias = "!g";
            "DuckDuckGo".metaData.alias = "!d";
            # Hidden
            "Amazon.com".metaData.hidden = true;
            "Bing".metaData.hidden = true;
          };
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
          "network.trr.mode" = 3; # Disallow unencrypted dns lookups
        };
        userChrome = builtins.readFile ./userChrome.css;
        userContent = lib.strings.concatStringsSep "\n" [
          (builtins.readFile ./usercontent/brightspace.css)
        ];
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
