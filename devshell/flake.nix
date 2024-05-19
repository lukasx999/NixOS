{
  description = "A simple dev shell";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
    {

        devShells.x86_64-linux.default = pkgs.mkShell {

            nativeBuildInputs = with pkgs; [
                brave
            ];

            shellHook = ''
                echo "welcome!!!"
                # PS1="greetings"

            '';

            COLOR = "blue";


        };

    };


}
