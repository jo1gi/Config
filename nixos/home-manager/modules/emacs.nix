{ config, pkgs, lib, ... }:

{
  config.programs.emacs = lib.mkIf config.personal.programming.enable {
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
  };
}
