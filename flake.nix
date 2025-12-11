{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

	zjstatus = {
		url = "github:dj95/zjstatus";
	};
  };

  outputs = { nixpkgs, zjstatus, home-manager, ... }@inputs: 
	let
      system = "x86_64_linux";

	  overlays = [
		  (final: prev: {
			zjstatus = zjstatus.packages.${prev.system}.default;
		  })
	  ];
	in
  {
    nixosConfigurations = {
		laptop = nixpkgs.lib.nixosSystem {
		  inherit system;

		  modules = [
			./configuration.nix
			./hosts/laptop/hardware-configuration.nix

			({ config, pkgs, ... }: {
			  nixpkgs.overlays = overlays;
			  nix.package = pkgs.nixVersions.latest;
			})

			home-manager.nixosModules.home-manager
			{
			  home-manager.useGlobalPkgs = true;
			  home-manager.useUserPackages = true;
			  home-manager.users.cabrams = import ./home.nix;
			  home-manager.extraSpecialArgs = {
				inherit inputs;
			  };
			}
		  ];
		};

		desktop = nixpkgs.lib.nixosSystem {
		  inherit system;

		  modules = [
			./configuration.nix
			./hosts/desktop/hardware-configuration.nix

			({ config, pkgs, ... }: {
			  nixpkgs.overlays = overlays;
			  nix.package = pkgs.nixVersions.latest;
			})

			home-manager.nixosModules.home-manager
			{
			  home-manager.useGlobalPkgs = true;
			  home-manager.useUserPackages = true;
			  home-manager.users.cabrams = import ./home.nix;
			  home-manager.extraSpecialArgs = {
				inherit inputs;
			  };
			}
		  ];
		};
	};
  };
}
