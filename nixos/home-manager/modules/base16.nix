{ ... }:

let
  nix-colors = import (builtins.fetchGit {
    url = "https://github.com/Misterio77/nix-colors.git";
    ref = "main";
  }) { };
in
{
  colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;

  imports = [
    nix-colors.homeManagerModule
  ];
}
