{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.programs.myjust.enable {

    home.packages = with pkgs; [
      just
    ];

    programs.neovim = {
      plugins = [
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
      ];
    };

  };

  options.programs.myjust = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
