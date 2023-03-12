{ config, pkgs, lib, ... }:

{
  config.home.packages = with pkgs; lib.mkIf config.jo1gi.scripting.enable [
    babashka
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

  options.jo1gi.scripting = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
