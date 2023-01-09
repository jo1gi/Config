# Configuration for standard terminal tools
{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.personal.terminal.enable {
    # Enable scripting languages like python and lua
    personal.scripting.enable = true;

    # Programs with home-manager configs
    programs = {
      bat.enable      = true;
      exa.enable      = true;
      git.enable      = true;
      neomutt.enable  = true;
      ssh.enable      = true;
      starship.enable = true;
      zsh.enable      = true;
      zoxide.enable   = true;
    };

    home.sessionPath = [
      "$HOME/.bin"
      "$HOME/.local/bin"
    ];

    # Universal shell aliases
    personal.terminal.aliases = {
      udm = "udisksctl mount -b";
    };

    # Other terminal programs
    home.packages = with pkgs; [
      # Applications
      libqalculate
      vifm-full
      ncdu

      # Syncronization
      rclone
      stow

      # File manipulation
      ffmpeg
      imagemagick
      pandoc
      graphviz
      # (texlive.combine { inherit (texlive) scheme-small; inherit dnd-latex-template; } )
      tectonic
      unzip
      zip
      unrar
      binutils
      pdftk
      age

      # Misc
      ripgrep # Seach tool like grep
      entr # Run command on file update
      skim # Fuzzy finder
      yt-dlp # Video downloader
      openurl # Url opening tool
      jq # Json cli tool
      file # Info about file
      hledger # Personal finance
      speedtest-cli # Speedtest cli
      gnupg1
      pinentry
      git-crypt
    ];
  };

  # Create personal terminal options
  options.personal.terminal = with lib; {
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
