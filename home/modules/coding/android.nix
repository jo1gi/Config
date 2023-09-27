{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.programming.android.enable {

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "android-studio-stable"
      "tools"
    ];
    nixpkgs.config = {
      android_sdk.accept_license = true;
    };

    home.packages = with pkgs; [
      android-studio
      androidenv.androidPkgs_9_0.androidsdk
    ];

    home.sessionVariables = {
      ANDROID_JAVA_HOME = pkgs.jdk.home;
      ANDROID_HOME = "${config.home.homeDirectory}/.local/share/android-home";
    };

    jo1gi.programming = {
      java.enable = true;
      kotlin.enable = true;
    };

  };

  options.jo1gi.programming.android = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
