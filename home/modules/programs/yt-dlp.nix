{ ... }:

{
  config.programs.yt-dlp = {
    settings = {
      embed-subs = true;
      sub-langs = "all";
      embed-metadata = true;
      embed-chapters = true;
    };
  };
}
