{ pkgs, ... }:

{
  imports = [
    ./virtualisation/docker.nix
  ];

  environment.systemPackages = with pkgs; [
    distrobox
  ];
}
