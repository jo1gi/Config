{ config, lib, ... }:

let
  cfg = config.programs.findProject;
in
{
  config = lib.mkIf cfg.enable {
    programs.zsh.initExtra = builtins.readFile ./find-projects.zsh;
    home.shellAliases = {
      p = "projects";
    };
    home.sessionVariables = {
      FIND_PROJECTS_DIR = cfg.dir;
    };
  };

  options.programs.findProject = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    dir = lib.mkOption {
      type = lib.types.str;
      default = "$HOME/Projects";
    };
  };
}
