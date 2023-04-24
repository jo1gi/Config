{ config, pkgs, ... }:

{
  config = {
    # Boot parameters
    boot.initrd.kernelModules = [ "amdgpu" ];
    boot.kernelModules = [ "kvm-amd" ];

    hardware = {
      # Video
      opengl = {
        enable = true;
        driSupport32Bit = config.hardware.opengl.enable;
        extraPackages = with pkgs; [
          amdvlk
        ];
        extraPackages32 = with pkgs; [
          driversi686Linux.amdvlk
        ];
      };
    };

    # X settings
    services.xserver ={
      videoDrivers = [ "amdgpu" ];
      deviceSection = ''Option "TearFree" "true"'';
    };
  };
}
