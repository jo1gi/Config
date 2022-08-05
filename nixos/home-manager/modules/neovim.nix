{ config, pkgs, ... }:

let
  unstable = import <unstable> {
    config = config.nixpkgs.config;
  };
in
{
  config = {
    nixpkgs.overlays = [
      (import (builtins.fetchTarball {
        url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
      }))
    ];
    programs.neovim = {
      extraConfig = ''
        set runtimepath^=/home/jo1gi/.config/neovim
        set runtimepath^=/home/jo1gi/Projects/Vim/Org
        lua require('jo1gi.main')
        autocmd ColorScheme * call highlight#update()
        colorscheme base16-gruvbox-dark-medium
        set mouse=""
      '';
      # package = pkgs.neovim;
      plugins = with unstable.vimPlugins; [
        vim-commentary # Commenting shortcuts
        gitsigns-nvim # Git diff symbols
        lexima-vim # Auto close parentheses
        telescope-nvim # Fuzzy find
        conjure # Lisp REPL
        vim-table-mode
        (pkgs.vimUtils.buildVimPlugin {
          pname = "which-key-nvim";
          version = "1";
          src = builtins.fetchGit {
            url = "https://github.com/folke/which-key.nvim.git";
            ref = "main";
          };
        })
        (pkgs.vimUtils.buildVimPlugin {
          pname = "plenary-nvim";
          version = "1";
          src = builtins.fetchGit {
            url = "https://github.com/nvim-lua/plenary.nvim.git";
            ref = "master";
          };
          buildPhase = ":";
          configurePhase =":";
        })

        # Theming
        lualine-nvim
        indentLine
        nvim-web-devicons

        # Language plugins
        nvim-lspconfig # Main lsp
        lspsaga-nvim # Extra lsp capabilities
        lspkind-nvim # Images for lsp completion
        trouble-nvim # Inline diagnostics
        vim-nix
        fennel-vim
        vim-ledger
        vim-jinja
        vim-toml
        kotlin-vim
        vifm-vim
        nim-vim
        Coqtail
        neorg
        vim-racket
        (pkgs.vimUtils.buildVimPlugin {
          pname = "vim-sile";
          version = "1";
          src = builtins.fetchGit {
            url = "https://github.com/sile-typesetter/vim-sile.git";
            ref = "master";
          };
        })
        (pkgs.vimUtils.buildVimPlugin {
          pname = "vim-crystal";
          version = "1";
          src = builtins.fetchGit {
            url = "https://github.com/vim-crystal/vim-crystal.git";
            ref = "master";
          };
        })
        (pkgs.vimUtils.buildVimPlugin {
          pname = "vim-ion";
          version = "1";
          src = builtins.fetchGit {
            url = "https://gitlab.redox-os.org/redox-os/ion-vim.git";
            ref = "master";
          };
        })
        nvim-treesitter
        nvim-treesitter-textobjects
        nvim-ts-rainbow

        # Completion
        nvim-cmp # Completion engine
        cmp-path # Path completion
        cmp-nvim-lsp # Lsp support for nvim-cmp
        # luasnip # Snippets
        # cmp_luasnip # Snippet completion
        (pkgs.vimUtils.buildVimPlugin {
          pname = "nvim-snippy";
          version = "1";
          src = builtins.fetchGit {
            url = "https://github.com/dcampos/nvim-snippy.git";
            ref = "master";
          };
          buildPhase = ":";
          configurePhase =":";
        })
        (pkgs.vimUtils.buildVimPlugin {
          pname = "cmp-snippy";
          version = "1";
          src = builtins.fetchGit {
            url = "https://github.com/dcampos/cmp-snippy.git";
            ref = "master";
          };
        })
        cmp-emoji # Emoji completion
      ];
    extraPython3Packages = (ps: with ps; [
      pynvim
      requests
    ]);
  };
};
}
