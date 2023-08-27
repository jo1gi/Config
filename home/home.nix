{ inputs, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "jo1gi";
    homeDirectory = "/home/jo1gi";
    stateVersion = "22.11";
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.nur.overlay
      (self: super: {
        openurl = pkgs.callPackage ./packages/openurl.nix {};
      })
    ];
  };

  imports = [
    ./modules/base16.nix
    ./modules/cleanup.nix
    ./modules/desktops/sway.nix
    ./modules/general.nix
    ./modules/gtk.nix
    ./modules/mail.nix
    ./modules/partisia.nix
    ./modules/programming/mod.nix
    ./modules/programs/alacritty.nix
    ./modules/programs/emacs.nix
    ./modules/programs/exa.nix
    ./modules/programs/firefox.nix
    ./modules/programs/git.nix
    ./modules/programs/hledger.nix
    ./modules/programs/just.nix
    ./modules/programs/vifm.nix
    ./modules/programs/mpd.nix
    ./modules/programs/mpv.nix
    ./modules/programs/neovim.nix
    ./modules/programs/ssh.nix
    ./modules/programs/starship.nix
    ./modules/programs/vscode.nix
    ./modules/programs/zsh.nix
    ./modules/terminal.nix
    ./modules/windowmanager.nix
  ];
}
