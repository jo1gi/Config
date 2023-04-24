{ ... }:

let
  authorizedKeys = [
    ../../../assets/public_keys/desktop.keys.pub
  ];
in
{
  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
    passwordAuthentication = false;
  };

  users.users.jo1gi = {
    openssh.authorizedKeys.keyFiles = authorizedKeys;
  };
  users.users.root = {
    openssh.authorizedKeys.keyFiles = authorizedKeys;
  };
}
