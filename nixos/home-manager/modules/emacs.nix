{ config, pkgs, lib, ... }:

{
  config.programs.emacs = lib.mkIf config.personal.programming {
    extraPackages = epkgs: with epkgs; [
      # Misc
      evil # Vim keybindings
      ido-vertical-mode
      helm # Fuzzy finding
      company # Completion
      projectile # Project management
      which-key # Shortcut suggestions

      # Language plugins
      eglot
      rust-mode
      crystal-mode
      nix-mode
      clojure-mode
      csharp-mode
      nim-mode

      # Theming
      base16-theme
      gruvbox-theme
    ];
  };
}
