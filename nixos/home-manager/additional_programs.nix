{ pkgs, ... }:

{
  nixpkgs.overlays = [(self: super: {
    # Nix user repo
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };

    # Extra programs
    openurl = import ./derivations/openurl.nix;
    # dnd-latex-template.pkgs = [ (import ./derivations/texlive-dnd.nix) ];
    #pybase16 = import ./derivations/pybase16.nix;
    #base16-themes = import ./derivations/base16-themes.nix;
  })];
}
