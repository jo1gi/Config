with import <nixpkgs> { };
with pkgs.python3Packages;

buildPythonPackage rec {
  name = "pybase16";
  src = builtins.fetchGit {
    url = "https://github.com/InspectorMustache/base16-builder-python.git";
    ref = "master";
  };
  propagatedBuildInputs = [ pystache pyyaml aiofiles setuptools git ];
}
