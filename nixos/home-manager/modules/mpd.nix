{ pkgs, config, ... }:

{
  config = {
    programs.ncmpcpp = {
      enable = true;
    };
    services.mpd = {
      enable = true;
      musicDirectory = builtins.toPath "${config.home.homeDirectory}/Music";
    };
  };
}
