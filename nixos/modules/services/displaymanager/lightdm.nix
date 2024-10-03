{ ... }:

{
  config.services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = "jo1gi";
      };
    };
    xserver.displayManager.lightdm = {
      greeters = {
        gtk = {
          enable = true;
        };
      };
    };
  };
}
