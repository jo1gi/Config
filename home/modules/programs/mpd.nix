{ pkgs, config, ... }:

{
  config = lib.mkIf config.services.mpd.enable {
    programs.ncmpcpp = {
      enable = true;
    };
    home.packages = with pkgs; [
      mpd-cli
    ];
    services.mpd = {
      enable = true;
      musicDirectory = builtins.toPath "${config.home.homeDirectory}/Music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "pipewire"
        }
      '';
    };
  };
}
