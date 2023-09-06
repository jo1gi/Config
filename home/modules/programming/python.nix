{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.jo1gi.programming.python.enable {

    home.packages = with pkgs; [
      (python3.withPackages(ps: with ps; [
        pip
        setuptools
        requests
        rich
        lxml
        cssselect
        pillow
        distro
        pyyaml
        pycrypto
        pylsp-mypy

        # Numerisk lineær algebra
        numpy
        matplotlib
      ]))
    ];

    programs.neovim = {
      extraLuaConfig = ''
        require('jo1gi.helpers.setup_lsp')("pylsp")
      '';
      treeSitterGrammars = [
        pkgs.vimPlugins.nvim-treesitter-parsers.python
      ];
    };

  };

  options.jo1gi.programming.python = {

    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

  };
}
