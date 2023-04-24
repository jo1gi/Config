# Enable virt-manager
{ config, pkgs, lib, ... }:

{
  config = {
    virtualisation.libvirtd.enable = true;
    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [ virt-manager ];
    users.users.jo1gi.extraGroups = [ "libvirtd" ];
  };
}
