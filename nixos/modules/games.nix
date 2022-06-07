{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.personal.games.enable {
    programs.steam.enable = true;
    hardware.opengl.driSupport32Bit = true;
    hardware.opengl.enable = true;
    hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
    hardware.pulseaudio.support32Bit = true;
    environment.systemPackages = with pkgs; [
      # Applications
      discord
      lutris
      wineWowPackages.stable

      # Libraries
      vulkan-tools
      vulkan-loader
      mesa
      mesa_drivers

      # 32 bit
      pkgsi686Linux.vulkan-tools
      pkgsi686Linux.vulkan-loader
      pkgsi686Linux.mesa
      pkgsi686Linux.mesa_drivers
    ];
    
  };

  options.personal.games.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };
}

