{ config, ... }:

{
  config.yggdrasil = {
    enable = true;
    settings = {
      Peers = [
        # Germany
        "tcp://193.107.20.230:7743"
        # France
        "tls://152.228.216.112:23108"
        "tcp://51.15.204.214:12345"
        "tls://51.15.204.214:54321"
        # Finland
        "tls://95.216.5.243:18836"
        "tls://65.21.57.122:61995"
      ];
    };
  };
}
