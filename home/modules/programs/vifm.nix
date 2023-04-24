{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.programs.vifm.enable {
    home.packages = with pkgs; [
      vifm-full
    ];

    programs.neovim = {
      plugins = with pkgs.vimPlugins; [
        vifm-vim
      ];
    };
  };

  options.programs.vifm = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
