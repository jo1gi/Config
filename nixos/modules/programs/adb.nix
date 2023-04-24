{ ... }:

{
  config = {
    programs.adb.enable = true;
    users.users.jo1gi.extraGroups = [ "adbusers" ];
  };
}
