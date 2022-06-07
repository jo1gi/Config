{ config, lib, ... }:

{
  imports = [
    ./sound/pipewire.nix
    ./sound/pulseaudio.nix
  ];

  options.personal.soundsystem = lib.mkOption {
    type = lib.types.enum [
      "none"
      "pipewire"
      "pulseaudio"
    ];
    default = "pipewire";
  };
}
