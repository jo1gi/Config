{ pkgs, config, lib, ... }:

let
  cfg = config.programs.neovim;
in
{
  config = {
    programs.neovim = lib.mkIf cfg.enableNeorg {
      extraLuaConfig = builtins.readFile ./neorg.lua;

      plugins = with pkgs.vimPlugins; with pkgs.luajitPackages; [
        neorg

        plenary-nvim
        nui-nvim
        pathlib-nvim
        lua-utils-nvim
        nvim-nio
      ];
    };
  };

  options.programs.neovim.enableNeorg = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };
}
