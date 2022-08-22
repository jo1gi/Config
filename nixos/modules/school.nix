{ config, lib, ... }:

{
  config = lib.mkIf config.personal.school.enable {
    home-manager.users.jo1gi.config.personal.school.enable = true;
  };

  options.personal.school = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
