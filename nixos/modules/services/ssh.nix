{ ... }:

let
  authorizedKeys = [
    ../../../assets/public_keys/desktop.keys.pub
    ../../../assets/public_keys/lenovo.keys.pub
  ];
in
{
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = false;
      GatewayPorts = "yes";
    };
  };

  users.users.jo1gi = {
    openssh.authorizedKeys.keyFiles = authorizedKeys;
  };
  users.users.root = {
    openssh.authorizedKeys.keyFiles = authorizedKeys;
  };
}
