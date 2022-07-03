{ ... }:

{
  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;

  xdg.configFile."nixpkgs/config.nix".source= ./nixpkgs-config.nix;

  home = {
    username = "jo1gi";
    homeDirectory = "/home/jo1gi";
    stateVersion = "21.05";
  };

  imports = [
    ./additional_programs.nix

    ./modules/alacritty.nix
    ./modules/base16.nix
    ./modules/emacs.nix
    ./modules/exa.nix
    ./modules/firefox.nix
    ./modules/git.nix # TODO: Add merge option
    ./modules/general.nix
    ./modules/mail.nix
    ./modules/mpd.nix
    ./modules/mpv.nix
    ./modules/neovim.nix
    ./modules/programming.nix
    ./modules/scripting.nix
    ./modules/starship.nix
    ./modules/terminal.nix
    ./modules/vscode.nix
    ./modules/windowmanager.nix
    ./modules/zsh.nix
  ];
}
