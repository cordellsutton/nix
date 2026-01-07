{
  description = "wren lang";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.stdenv.mkDerivation rec {
          pname = "wren";
          version = "0.4.0"; 

          src = pkgs.fetchFromGitHub {
            owner = "wren-lang";
            repo = "wren";
            rev = version;
            sha256 = "sha256-ZaJ9As7xGPB0Ty1kVsTBCweeiIgfROZbtUHxYT0tFnE="; # See note below
          };
	
          preBuild = '' 
            cd projects/make
          '';

          installPhase = ''
			mkdir -p $out/lib
            mkdir -p $out/include
            cp ../../lib/libwren.* $out/lib/
            cp ../../src/include/wren.h $out/include/
          '';
          meta = with pkgs.lib; {
            description = "A small, fast, class-based concurrent scripting language";
            homepage = "https://wren.io";
            license = licenses.mit;
            platforms = platforms.all;
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = [ self.packages.${system}.default ];
        };
      });
}
