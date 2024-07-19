{ pkgs, stdenv, ... }:

stdenv.mkDerivation {
  name = "create-docker-image.nim";
  src = ./create_docker_image.nim;

  nativeBuildInputs = [
    pkgs.nim
  ];

  buildPhase = ''
    cp $src create_docker_image.nim
    nim compile --nimcache:. -o:create-docker-image -d:release create_docker_image.nim
  '';

  unpackPhase = "true";

  installPhase = ''
    mkdir -p $out/bin
    cp create-docker-image $out/bin
  '';
}
