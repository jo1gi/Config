with import <nixpkgs> {};

stdenv.mkDerivation {
	pname = "openurl";
	version = "0.1.0";
	src = builtins.fetchGit {
		url = "https://github.com/jo1gi/openurl.git";
		ref = "master";
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
