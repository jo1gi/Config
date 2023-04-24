{ ... }:

{
  config.services.gpg-agent = {
    enableSshSupport = true;
    enableZshIntegration = true;
  };
}
