{ pkgs, config, ... }:

{
  services.nextcloud = {
    enable = true;
    hostName = "nextcloud.joakimholm.xyz";
    package = pkgs.nextcloud26;
    extraApps = with pkgs.nextcloud26Packages.apps; {
      inherit mail contacts;
    };
    extraAppsEnable = true;
    config = {
      adminpassFile = "/etc/nextcloud-admin-pass";
    };
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    forceSSL = true;
    enableACME = true;
  };

}
