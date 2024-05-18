{
  description = "My NixOS configuration flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # nixpkgs-stable.url = "nixpkgs/nixos-23.05";
    nixpkgs.url = "nixpkgs/nixos-unstable";


    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
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
              specialArgs = { inherit inputs system; };
              modules = [
                  ./nixos/configuration.nix
              ];
          };
      };








  };
}
