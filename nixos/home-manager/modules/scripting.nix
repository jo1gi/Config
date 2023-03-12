{ config, pkgs, lib, ... }:

let
  unstable = import <unstable> {
    config = config.nixpkgs.config;
  };
in
{
  config.home.packages = with pkgs; lib.mkIf config.personal.scripting.enable [
    unstable.babashka
    (python3.withPackages(ps: with ps; [
      pip
      setuptools
      requests
      rich
      lxml
      cssselect
      pillow
      distro
      pyyaml
      pycrypto
      pylsp-mypy

      # Numerisk lineær algebra
      numpy
      matplotlib
    ]))
    lua5_3
    ruby
  ];

  options.personal.scripting = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
