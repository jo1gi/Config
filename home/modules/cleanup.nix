{ config, ... }:

let
  cacheHome = config.xdg.cacheHome;
  configHome = config.xdg.configHome;
  dataHome = config.xdg.dataHome;
  stateHome = config.xdg.stateHome;
in
  {
  # Cleanup variables
  home.sessionVariables = {
    ANDROID_HOME = "${dataHome}/android";
    AUDIBLE_CONFIG_DIR = "${configHome}/audible";
    CARGO_HOME = "${configHome}/cargo";
    CUDA_CACHE_PATH = "${cacheHome}/nv";
    DOCKER_CONFIG = "${configHome}/docker";
    GRADLE_USER_HOME = "${dataHome}/gradle";
    HISTFILE = "${stateHome}/terminal-history";
    INPUTRC = "${configHome}/readline/inputrc";
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=\"${configHome}/java\"";
    LESSHISTFILE = "-";
    MYPY_CACHE_DIR = "${cacheHome}/mypy";
    NUGET_PACKAGES = "${cacheHome}/NuGetPackages";
    XCOMPOSECACHE = "${cacheHome}/X11/xcompose";
  };

  home.shellAliases = {
    wget = "wget --hsts-file=\"${cacheHome}/wget-hsts\"";
  };
}
