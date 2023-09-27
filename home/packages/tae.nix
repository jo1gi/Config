{ pkgs, fetchFromGitHub, rustPlatform, ... }:

rustPlatform.buildRustPackage rec {
  pname = "tae";
  version = "v0.1.0";

  src = fetchFromGitHub {
    owner = "jo1gi";
    repo = pname;
    rev = version;
    hash = "";
  };

  cargoHash = "";
}
