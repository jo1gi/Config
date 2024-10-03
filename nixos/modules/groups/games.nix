{ pkgs, ... }:

{
  config = {
    programs.steam.enable = true;
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages32 = [ pkgs.pkgsi686Linux.libva ];
      };
      pulseaudio.support32Bit = true;
    };
    environment.systemPackages = with pkgs; [
      # Applications
      lutris
      wineWowPackages.stable

      # Libraries
      vulkan-tools
      vulkan-loader
      mesa
      mesa.drivers

      # 32 bit
      pkgsi686Linux.vulkan-tools
      pkgsi686Linux.vulkan-loader
      pkgsi686Linux.mesa
      pkgsi686Linux.mesa.drivers
    ];
  };
}

