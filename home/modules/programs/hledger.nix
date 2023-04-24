{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.programs.hledger.enable {

    home.packages = with pkgs; [
      hledger
    ];

    programs.neovim = {
      plugins = with pkgs.vimPlugins; [
        vim-ledger
      ];
    };

  };

  options.programs.hledger = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
