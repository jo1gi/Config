# Configuration for standard terminal tools
{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.jo1gi.terminal.enable {

    # Programs with home-manager configs
    programs = {
      bat.enable      = true;
      exa.enable      = true;
      git.enable      = true;
      hledger.enable  = true;
      myjust.enable   = true;
      mbsync.enable   = false;
      neomutt.enable  = false;
      notmuch.enable  = false;
      nushell.enable  = true;
      ssh.enable      = true;
      starship.enable = true;
      vifm.enable     = true;
      zsh.enable      = false;
      zoxide.enable   = true;
    };

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    home.sessionPath = [
      "$HOME/.bin"
      "$HOME/.local/bin"
      "$HOME/.local/share/gem/ruby/2.7.0/bin"
    ];

    # Universal shell aliases
    jo1gi.terminal.aliases = {
      udm = "udisksctl mount -b";
    };

    # Other terminal programs
    home.packages = with pkgs; [
      # Applications
      libqalculate
      ncdu

      # Syncronization
      rclone
      stow
      git-annex
      git-annex-remote-rclone
      magic-wormhole

      # File manipulation
      ffmpeg
      imagemagick
      pandoc
      graphviz
      tectonic
      unzip
      zip
      binutils
      pdftk

      # Misc
      ripgrep # Seach tool like grep
      entr # Run command on file update
      skim # Fuzzy finder
      yt-dlp # Video downloader
      # openurl # Url opening tool
      jq # Json cli tool
      file # Info about file
      asciidoctor
    ];
  };

  # Create personal terminal options
  options.jo1gi.terminal = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
    font = mkOption {
      type = types.str;
      default = "InconsolataGo Nerd Font";
    };
    fontsize = mkOption {
      type = types.int;
      default = 11;
    };
    margin = mkOption {
      type = types.int;
      default = 10;
    };
    cursor = mkOption {
      type = types.str;
      default = "beam";
    };
    opacity = mkOption {
      type = types.int;
      default = 1;
    };
    aliases = mkOption {
      type = types.attrsOf types.str;
    };
  };
}
