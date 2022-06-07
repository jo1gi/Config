{ config, lib, ... }:

{
  config = lib.mkIf config.personal.general.enable {
    home-manager.users.jo1gi.config.personal.general.enable = true;
    # adb
    programs.adb.enable = true;
    users.users.jo1gi.extraGroups = [ "adbusers" ];
  };

  options.personal.general.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };
}
