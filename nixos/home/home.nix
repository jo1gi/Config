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
    ./modules/alacritty.nix
    ./modules/base16.nix
    ./modules/emacs.nix
    ./modules/firefox.nix
    ./modules/general.nix
    ./modules/gtk.nix
    ./modules/mail.nix
    ./modules/mpd.nix
    ./modules/mpv.nix
    ./modules/neovim.nix
    ./modules/programming.nix
    ./modules/scripting.nix
    ./modules/school.nix
    ./modules/sway.nix
    ./modules/terminal/default.nix
    ./modules/vscode.nix
    ./modules/windowmanager.nix
  ];
}
