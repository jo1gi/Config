with import <nixpkgs> {};

stdenv.mkDerivation {
	pname = "base16-themes";
	version = "1.0";
	buildInputs = [ pybase16 ];
	buildPhase = ''
    pybase16 build
	'';
	installPhase = ''
    cp -r output $out
	'';
}
