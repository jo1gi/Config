{ config, ... }:

{
  programs.git = {
    userName = "Joakim Holm";
    userEmail = "joakimholm@protonmail.com";
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
    ];
  };
}
