{ pkgs, config, lib, ... }:

{
  config = lib.mkIf config.services.mpd.enable {
    programs.ncmpcpp = {
      enable = true;
    };
    home.packages = with pkgs; [
      mpc-cli
    ];
    services.mpd = {
      musicDirectory = builtins.toPath "${config.home.homeDirectory}/Music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "pipewire"
        }
      '';
    };
    home.file = {
      "${config.home.homeDirectory}/.local/bin/music" = {
        source = ./music.sh;
        executable = true;
      };
    };
  };
}
