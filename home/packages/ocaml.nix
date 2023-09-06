{ pkgs, fetchurl, ... }:

ocaml.overrideAttrs {
  version = "5.0.0";
  src = fetchurl {
    url = "http://caml.inria.fr/pub/distrib/ocaml-5.0/ocaml-5.0.0.tar.xz";
    sha256 = "sha256-yxfwpTTdSz/sk9ARsL4bpcYIfaAzz3iehaNLlkHsxl8=";
  };
}
