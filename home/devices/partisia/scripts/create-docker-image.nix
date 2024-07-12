{ pkgs, stdenv, ... }:

stdenv.mkDerivation {
  name = "create-docker-image.fnl";
  src = ./create-docker-image.fnl;

  buildInputs = [
    (pkgs.luajit.withPackages(ps: with ps; [
      fennel
      xml2lua
    ]))
  ];

  unpackPhase = "true";

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/create-docker-image
  '';
}
