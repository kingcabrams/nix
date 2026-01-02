{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./configuration.nix
            ./hosts/laptop/hardware-configuration.nix

            ({ pkgs, ... }: {
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

            ({ pkgs, ... }: {
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
