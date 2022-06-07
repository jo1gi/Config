{ config, ... }:

{
  programs.git = {
    userName = "Joakim Holm";
    userEmail = "joakimholm@protonmail.com";
    extraConfig.init = {
      defaultBranch = "master";
    };
    ignores = [
      "todo.sh"
      "personal.nix"
      # Editor files (just in case)
      ".vscode"
      ".idea"
    ];
  };
}
