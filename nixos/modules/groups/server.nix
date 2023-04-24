{ pkgs, ... }:

{
  imports = [
    ../services/ssh.nix
  ];

  # Danish keyboard
	i18n.defaultLocale = "en_DK.UTF-8";
	console = {
		font = "Lat2-Terminus16";
		keyMap = "dk";
	};

  # User
  users.users.jo1gi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPassword = "$6$CH6w9C5z$iqS7KpWPDSHO0v6FTmMfTfsVaAdyNgwM8p6XObrgOaQhytmYtOcRak30NcNfdxHdekvDz1LZACT7ytzLzxHh41";
  };

  # Packages
  environment.systemPackages = with pkgs; [
    curl vim
  ];

}
