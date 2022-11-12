{ config, pkgs, lib, ... }:

{
  # Setup mail
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
        notmuch.enable = true;
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
        # Index
        { map = ["index"]; key = "g"; action = "noop"; }
        { map = ["index"]; key = "gg"; action = "first-entry"; }
        { map = ["index"]; key = "G"; action = "last-entry"; }
      ];
      settings = {
        index_format = "\"%4C %{%b %d} %g %-25.25L %s\"";
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
        color index bold default default "~U" # Unread messages
        # Menu
        color sidebar_divider lightblack default
        color status lightblack default
        color indicator default lightblack
      '';
    };
    notmuch.enable = true;
  };

  # Setup imapfilter
  home.packages = with pkgs; [
    imapfilter
    sieveshell # Manage remove sieve scripts
  ];
  home.sessionVariables = {
    IMAPFILTER_HOME = "$HOME/.config/imapfilter";
  };
  home.file.".config/imapfilter/certificates".source = ../assets/mailserver.crt;
}
