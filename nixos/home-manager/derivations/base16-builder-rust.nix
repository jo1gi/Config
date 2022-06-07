with import <nixpkgs> {};

rustPlatform.buildRustPackage {
  pname = "base16-builder-rust";
  version = "0.9.1";
  src = builtins.fetchGit {
    url = "https://github.com/ilpianista/base16-builder-rust.git";
    ref = "master";
  };
  buildInputs = [ pkg-config openssl ];
  cargoSha256 = "03zb0szb43g24bwgzhyl1dwg3nfkkxc4rhll89s1m3nzshsdsq6h";
}
