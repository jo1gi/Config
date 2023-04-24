{ config, lib, pkgs, ... }:

{
  config.programs.git = {
    userName = "Joakim Holm";
    userEmail = "mail@joakimholm.xyz";
    extraConfig = {
      init = {
        defaultBranch = "master";
      };
      pull = {
        rebase = false;
      };
    };
    ignores = [
      "todo.sh"
      "personal.nix"
      # Editor files (just in case)
      ".vscode"
      ".idea"
      # Build systems
      "jdtls-workspace"
    ];
  };

  config.home.packages = lib.mkIf config.programs.git.enable [
    pkgs.git-crypt
  ];
}
