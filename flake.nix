{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    unstable.url = "github:NixOS/nixpkgs";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    base16.url = "github:alukardbf/base16-nix";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./nixos/devices/desktop.nix ];
      };
      lenovo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./nixos/devices/lenovo.nix ];
      };
      mailserver = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./nixos/devices/mailserver.nix ];
      };
      hetzner = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [ ./nixos/devices/hetzner.nix ];
      };
    };

    homeConfigurations = {
      desktop = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/devices/desktop.nix ];
      };
      lenovo = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/devices/lenovo.nix ];
      };
    };
  };
}
