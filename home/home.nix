{ inputs, pkgs,  ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "jo1gi";
    homeDirectory = "/home/jo1gi";
    stateVersion = "22.11";
  };

  nixpkgs = {
    overlays = [
      inputs.nur.overlay
      (self: super: {
        openurl = pkgs.callPackage ./packages/openurl.nix {};
      })
    ];
    config.allowUnfree = true;
  };

  imports = [
    ./modules/base16.nix
    ./modules/desktops/sway.nix
    ./modules/general.nix
    ./modules/gtk.nix
    ./modules/mail.nix
    ./modules/mpd.nix
    ./modules/programming/mod.nix
    ./modules/programs/alacritty.nix
    ./modules/programs/emacs.nix
    ./modules/programs/exa.nix
    ./modules/programs/firefox.nix
    ./modules/programs/git.nix
    ./modules/programs/hledger.nix
    ./modules/programs/just.nix
    ./modules/programs/vifm.nix
    ./modules/programs/mpv.nix
    ./modules/programs/neovim.nix
    ./modules/programs/starship.nix
    ./modules/programs/vscode.nix
    ./modules/programs/zsh.nix
    ./modules/terminal.nix
    ./modules/windowmanager.nix
  ];
}
