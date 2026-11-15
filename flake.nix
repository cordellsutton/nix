
{

	description = "Planimal Flake";

	inputs = { 
	nixpkgs.url = "nixpkgs/nixos-unstable";
	};


	outputs = {self, nixpkgs,  ...}@inputs:
		let
			lib = nixpkgs.lib;

		in  { 
			nixosConfigurations = {
				seras = lib.nixosSystem {
					system = "x86_64-linux";
					specialArgs = { inherit inputs;};
					modules = [			./configuration.nix 
									#./automount.nix
									./network.nix
									#./program_config.nix
									./env_pkgs.nix
								];
					};
			};
		};	
}
