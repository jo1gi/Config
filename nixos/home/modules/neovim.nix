{ pkgs, config, ... }:

{
  config = {
    programs.neovim = {
      extraConfig = ''
        set runtimepath^=${config.home.homeDirectory}/.config/neovim
        lua require('jo1gi')
        set mouse=""
        autocmd ColorScheme * call highlight#update()
        colorscheme base16-gruvbox-dark-medium
      '';
      plugins = with pkgs.vimPlugins; [
        vim-commentary # Commenting shortcuts
        gitsigns-nvim # Git diff symbols
        lexima-vim # Auto close parentheses
        telescope-nvim # Fuzzy find
        conjure # Lisp REPL
        vim-table-mode
        which-key-nvim
        plenary-nvim

        # UI
        lualine-nvim # Statusline
        indentLine # Line indicating indents
        nvim-web-devicons # Icons for different plugins
        # nvim-tree-lua
        neo-tree-nvim # File tree
        nui-nvim # UI Library
        # (base16-vim.overrideAttrs (old:
        #   let
        #     scheme = config.lib.base16.templateFile { name = "vim"; };
        #   in {
        #     patchPhase = ''echo ${scheme} > colors/base16-scheme.vim'';
        #   }))

        # Language plugins
        nvim-lspconfig # Main lsp
        lspsaga-nvim # Extra lsp capabilities
        lspkind-nvim # Images for lsp completion
        trouble-nvim # Inline diagnostics
        nvim-jdtls # Java lsp

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
        vim-mustache-handlebars
        (pkgs.vimUtils.buildVimPlugin {
          pname = "vim-crystal";
          version = "1";
          src = pkgs.fetchFromGitHub {
            owner = "vim-crystal";
            repo = "vim-crystal";
            rev = "a760ad003e14c800a5e53bf2631f51280353883c";
            sha256 = "sha256-vhwxu7h/Gf5JFhNzbO6SxaaX6MHq0doQ96UO0N0vIb0=";
          };
        })
        (pkgs.vimUtils.buildVimPlugin {
          pname = "just.vim";
          version = "1";
          src = pkgs.fetchFromGitHub {
            owner = "tmccombs";
            repo = "just.vim";
            rev = "54188993a7c11943f2a763337a017d0e3191bd0c";
            sha256 = "sha256-9zVyZa6jHXj86SMAlqlL8C4xGBFdYIr/eEHHdQpFPTw=";
          };
        })
        (nvim-treesitter.withPlugins(_: pkgs.tree-sitter.allGrammars))
        nvim-treesitter-textobjects
        nvim-ts-rainbow

        # Completion
        # nvim-cmp # Completion engine
        cmp-path # Path completion
        cmp-nvim-lsp # Lsp support for nvim-cmp
        nvim-cmp
        nvim-snippy
        cmp-snippy
      ];
    extraPython3Packages = (ps: with ps; [
      pynvim
      requests
    ]);
  };
};
}
