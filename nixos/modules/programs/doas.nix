{ ... }:

{
  config.security = {
    doas = {
      enable = true;
      extraRules = [
        { groups = [ "wheel" ]; keepEnv = true; cmd = "nvim"; }
      ];
    };
  };
}
