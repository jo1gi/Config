{ ... }:

{
  programs.mpv = {
    config = {
      vo = "gpu";
      hwdec = "auto-safe";
      profile = "gpu-hq";
      ytdl-format = "best[height<=720]";
    };
  };
}

