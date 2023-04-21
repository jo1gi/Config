{ config, lib, pkgs, ... }:

{

  config = lib.mkIf config.jo1gi.programming.android.enable {

    home.sessionVariables = {
      ANDROID_JAVA_HOME = pkgs.jdk.home;
      ANDROID_HOME = "$HOME/.android";
    };

    jo1gi.programming = {
      java.enable = true;
    };

  };
}
