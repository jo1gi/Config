{ pkgs, fetchFromGitHub, ... }:

with pkgs;
stdenv.mkDerivation {
	pname = "openurl";
	version = "0.1.0";
	src = fetchFromGitHub {
    owner = "jo1gi";
    repo = "openurl";
    rev = "72bc440e1c3e6311a0282c8f9d8c496d4ce8f0d8";
    sha256 = "sha256-vhwxu7h/Gf5JFhNzbO6SxaaX6MHq0doQ96UO0N0vIb0=";
	};
	buildInputs = [ crystal shards ];
	buildPhase = ''
		shards build --production
	'';
	installPhase = ''
		mkdir -p $out/bin
		cp bin/openurl $out/bin
	'';
}
