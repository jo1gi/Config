{ ... }:

{
  config.programs.atuin = {
    flags = [
      "--disable-up-arrow"
    ];
    settings = {
      auto_sync = false;
    };
  };
}
