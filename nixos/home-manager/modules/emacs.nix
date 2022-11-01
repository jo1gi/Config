{ config, pkgs, lib, ... }:

{
  config.programs.emacs = {
    extraPackages = epkgs: with epkgs; [
      # Misc
      evil # Vim keybindings
      ido-vertical-mode
      helm # Fuzzy finding
      company # Completion
      projectile # Project management
      which-key # Shortcut suggestions
      eglot # Lsp

      # Language plugins
      clojure-mode
      crystal-mode
      csharp-mode
      nim-mode
      nix-mode
      rust-mode

      # Theming
      base16-theme
      gruvbox-theme
    ];
    extraConfig = lib.concatStrings [
      ''
        (org-babel-load-file (expand-file-name "~/.config/emacs/config.org"))
      ''
    ];
  };
}
