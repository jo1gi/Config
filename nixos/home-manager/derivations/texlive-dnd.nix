with import <nixpkgs> {};

stdenv.mkDerivation {
	pname = "dnd-latex-template";
	version = "0.8.0";
	src = builtins.fetchGit {
		url = "https://github.com/rpgtex/DND-5e-LaTeX-Template.git";
		ref = "dev";
	};
  tlType = "run";
  dontBuild = true;
  installPhase = ''
		mkdir -p $out/tex/latex/dnd
		cp -r * $out/tex/latex/dnd
	'';
}
