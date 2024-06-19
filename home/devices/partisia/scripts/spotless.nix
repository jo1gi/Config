{ pkgs, stdenv, ... }:

stdenv.mkDerivation {
  name = "spotless.raku";
  src = ./spotless.raku;

  buildInputs = [
    pkgs.rakudo
  ];

  unpackPhase = "true";

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/spotless
  '';
}
