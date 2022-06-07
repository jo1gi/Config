with import <nixpkgs> {};

stdenv.mkDerivation rec {
  pname = "my-base16";
  version = "1.0";
  src = ../configs/neovim/base16;
  buildInputs = with pkgs; [ base16-builder ];
  buildPhase = ''
    base16-builder -s ${config.personal.base16} -t vim > base16.vim
  '';
  installPhase = ''
    mkdir -p $out/colors $out/autoload $out/plugin
    mv base16.vim $out/colors
    mv highlight.vim $out/autoload
    mv colorscheme.vim $out/plugin
  '';
}
