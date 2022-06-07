# Enable virt-manager
{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.personal.vm.enable {
    virtualisation.libvirtd.enable = true;
    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [ virt-manager ];
    users.users.jo1gi.extraGroups = [ "libvirtd" ];
  };

  options.personal.vm.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };
}
