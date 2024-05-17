{ config, lib, pkgs, ... }:

let
  cfg = config.jo1gi.programming.rust;
  normalPackages = with pkgs; [
    clippy
    rust-analyzer
    cargo
    rustc
  ];
  rustupPackages = with pkgs; [ rustup ];
  cargoHome = "${config.xdg.dataHome}/cargo";
in
{
  config = lib.mkIf cfg.enable {

    home = {
      packages = if cfg.useRustup then rustupPackages else normalPackages;
      sessionVariables = {
        CARGO_HOME = cargoHome;
      };
      file = {
        "${cargoHome}/config.toml" = {
          source = ./assets/cargo-config.toml;
        };
      };
    };

    programs.neovim = {
      extraLuaConfig = ''
        require('jo1gi.helpers.setup_lsp')("rust_analyzer")
      '';
    };

  };

  options.jo1gi.programming.rust = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    useRustup = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
