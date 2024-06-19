{ pkgs, config, lib, ... }:

let
  cfg = config.programs.neovim;
in
{
  imports = [
    ./neorg.nix
  ];

  config = {
    programs.neovim = {
      extraConfig = ''
        set runtimepath^=${config.home.homeDirectory}/.config/neovim
        lua require('jo1gi')
        set mouse=""
        colorscheme gruvbox
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
        neo-tree-nvim # File tree
        nui-nvim # UI Library
        gruvbox-nvim

        # Language plugins
        nvim-lspconfig # Main lsp
        lspsaga-nvim # Extra lsp capabilities
        lspkind-nvim # Images for lsp completion
        trouble-nvim # Inline diagnostics

        vim-nix
        vim-jinja
        vim-toml
        vim-mustache-handlebars
        nvim-treesitter.withAllGrammars
        # nvim-treesitter-textobjects

        # Completion
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
