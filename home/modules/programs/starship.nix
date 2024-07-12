{config, lib, ... }:

{
  programs.starship = {
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$directory"
        "$nix_shell"
        "$git_branch"
        " "
      ];
      directory = {
        style = "bold green";
        fish_style_pwd_dir_length = 1;
      };
      git_branch = {
        symbol = "󰘬 ";
        style = "bold yellow";
      };
    };
  };
}
