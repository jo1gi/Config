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
        tae = pkgs.callPackage ./packages/tae.nix {};
      })
    ];
  };

  imports = [
    ./modules/base16.nix
    ./modules/cleanup.nix
    ./modules/general.nix
    ./modules/gtk.nix
    ./modules/mail.nix
    ./modules/terminal.nix
    ./modules/windowmanager.nix

    ./modules/coding
    ./modules/desktops
    ./modules/programs
  ];
}
