{ pkgs, ... }:

{
  jo1gi.programming = {
    ocaml.enable = true;
  };

  programs.neovim = {
    plugins = [
      (pkgs.vimUtils.buildVimPlugin {
        pname = "dolphin.vim";
        version = "1";
        src = pkgs.fetchFromGitLab {
          owner = "jo1gi";
          repo = "dolphin-vim";
          rev = "1bddf3c798cbb425f0a288c1a3640e06bea2fccc";
          sha256 = "sha256-28fPWSYOHyBLiwVkGyYoslpWnqrBFozaSnhFNQ8NG9o=";
        };
      })
    ];
  };
}
