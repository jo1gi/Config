{
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
        }
