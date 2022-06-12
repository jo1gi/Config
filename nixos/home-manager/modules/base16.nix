{ ... }:

let
  nix-colors = import (builtins.fetchGit {
    url = "https://github.com/Misterio77/nix-colors.git";
    ref = "2.0.0";
  }) { };
in
{
  colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;

  imports = [
    nix-colors.homeManagerModule
  ];
}
