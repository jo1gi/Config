{ config, pkgs, lib, ... }:

let
  unstable = import <unstable> {
    config = config.nixpkgs.config;
  };
in
{
  config.home.packages = with pkgs; lib.mkIf config.personal.scripting.enable [
    unstable.babashka
    nodePackages.pyright
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
    ]))
    lua5_3
  ];

  options.personal.scripting = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
