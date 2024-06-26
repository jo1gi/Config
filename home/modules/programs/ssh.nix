{ config, pkgs, ... }:

{
  config = {
    programs.gpg = {
      enable = true;
      homedir = "${config.xdg.configHome}/gpg";
    };
    services.gpg-agent = {
      enableSshSupport = true;
      enableZshIntegration = true;
      pinentryPackage = pkgs.pinentry-qt;
    };
  };
}
