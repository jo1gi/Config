{ config, pkgs, ... }:

{
  config.programs.vscode = {
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      asvetliakov.vscode-neovim
    ];
  };
}
