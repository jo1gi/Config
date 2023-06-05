{ pkgs, ... }:

{
  services.nextcloud = {
    enable = true;
    hostName = "nextcloud.joakimholm.xyz";
    package = pkgs.nextcloud26;
    extraApps = with pkgs.nextcloud26Packages.apps; {
      inherit mail news contacts;
    };
    extraAppsEnable = true;
    config = {
      adminpassFile = "/etc/nextcloud-admin-pass";
    };
  };
}
