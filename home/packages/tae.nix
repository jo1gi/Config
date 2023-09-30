{ pkgs, fetchFromGitHub, rustPlatform, ... }:

rustPlatform.buildRustPackage rec {
  pname = "tae";
  version = "v0.1.0";

  src = fetchFromGitHub {
    owner = "jo1gi";
    repo = pname;
    rev = version;
    hash = "sha256-1y76zrniOaLmDx65udA1mF+8xJQZJvR3oiCqUGMLDNY=";
  };

  cargoHash = "sha256-Dwyj0E3KS50gl2btIA3uj9xgj9A85LdYc2YP3ZiXKOk=";
}
