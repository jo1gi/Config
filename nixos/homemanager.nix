{ config, lib, ... }:

let
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    ref = "release-22.05";
  };
in
  {
    imports = [
      (import "${home-manager}/nixos")
    ];

    home-manager.users.jo1gi = (import ./home-manager/standard.nix);
  }
