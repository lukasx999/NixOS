{
  description = "My NixOS configuration flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixpkgs-stable.url = "nixpkgs/nixos-23.05";
    nixpkgs.url = "nixpkgs/nixos-unstable";


    # nix-flatpak.url = "github:gmodena/nix-flatpak";  # Unstable branch


    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-stable, ... }@inputs:
  let
    system = "x86_64-linux";

    # lib = nixpkgs.lib;

    pkgs = import nixpkgs {
        inherit system;
        config = {
            allowUnfree = true;
        };
    };

    pkgs-stable = import nixpkgs-stable {
        inherit system;
        config = {
            allowUnfree = true;
        };
    };


  in
  {


      nixosConfigurations = {
          # myNixos = nixpkgs.lib.nixosSystem {
          lukdt = nixpkgs.lib.nixosSystem {
              specialArgs = { inherit inputs system pkgs-stable; };
              modules = [
                  ./nixos/configuration.nix
              ];
          };
      };








  };
}
