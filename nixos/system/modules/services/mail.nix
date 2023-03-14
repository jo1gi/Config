{ config, pkgs, ... }:

let
  release = "nixos-22.11";
in
{
  imports = [
    (builtins.fetchTarball {
      url = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/${release}/nixos-mailserver-${release}.tar.gz";
      sha256 = "1h1r4x2ffqwyk0ql6kjvcpg1bdiimyzhrsvn49702fsgzpx57fhd";
    })
  ];

  mailserver = {
    enable = true;
    enableManageSieve = true;
    fqdn = "joakimholm.xyz";
    domains = [ "joakimholm.xyz" ];
    hierarchySeparator = "/";
    loginAccounts = {
      "mail@joakimholm.xyz" = {
        # nix run nixpkgs.apacheHttpd -c htpasswd -nbB "" "super secret password" | cut -d: -f2 > /hashed/password/file/location
        hashedPasswordFile = ../../../assets/mailpassword.hash;
        aliases = [ "@joakimholm.xyz" ];
      };
    };
    certificateScheme = 3;
  };

  security.acme = {
    defaults.email = "mail@joakimholm.xyz";
    acceptTerms = true;
  };
}
