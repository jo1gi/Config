{ config, pkgs, lib, ... }:

{
  accounts.email = {
    maildirBasePath = "Documents/Mail";
    accounts = {
      joakimholm = {
        primary = true;
        realName = "Joakim Holm";
        userName = "mail@joakimholm.xyz";
        address = "mail@joakimholm.xyz";
        aliases = [
          "@joakimholm.xyz"
        ];
        passwordCommand = "cat ~/.config/mailpassword";
        imap = {
          host = "joakimholm.xyz";
          port = 993;
          tls = {
            enable = true;
            certificatesFile = ../assets/mailserver.crt;
          };
        };
        smtp = {
          host = "joakimholm.xyz";
          port = 465;
          tls.enable = true;
        };
        mbsync = {
          enable = true;
          create = "both";
        };
        neomutt = {
          enable = config.personal.terminal.enable;
          extraMailboxes = [
            "Drafts" "Junk" "Notifikationer" "Sent" "Shopping" "Spejder" "Trash" "Uni"
          ];
        };
      };
    };
  };
  programs = {
    mbsync.enable = true;
    neomutt = {
      editor = lib.mkIf config.programs.neovim.enable "nvim";
      vimKeys = false;
      binds = [
        # General
        { map = ["index" "pager"]; key = "\\CP"; action = "sidebar-prev"; }
        { map = ["index" "pager"]; key = "\\CN"; action = "sidebar-next"; }
        { map = ["index" "pager"]; key = "\\CO"; action = "sidebar-open"; }
        { map = ["generic" "query"]; key = "<esc>"; action = "close"; }
        # Index
        { map = ["index"]; key = "g"; action = "noop"; }
        { map = ["index"]; key = "gg"; action = "first-entry"; }
        { map = ["index"]; key = "G"; action = "last-entry"; }
      ];
      settings = {
        index_format = "\"%4C %{%b %d} %-25.25L %s\"";
      };
      sidebar = {
        enable = true;
        shortPath = true;
      };
      extraConfig = ''
        # Index
        color index_date green default
        color index_number cyan default
        color index_author blue default .*
        # Menu
        color sidebar_divider lightblack default
        color status lightblack default
        color indicator default lightblack

        unbind g
      '';
    };
  };
}
