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

  outputs =
    {
      nixpkgs,
      home-manager,
      zjstatus,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      overlays = [
        (final: prev: {
          zjstatus = zjstatus.packages.${prev.system}.default;
        })
      ];

      sharedModules = [
        ./configuration.nix

        (
          { pkgs, ... }:
          {
            nix.package = pkgs.nixVersions.latest;
            nixpkgs.overlays = overlays;
          }
        )

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.cabrams = import ./home.nix; 
          home-manager.backupFileExtension = "bak";
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };
        }
      ];
    in
    {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./hosts/laptop/hardware-configuration.nix
          ]
          ++ sharedModules;
        };

        home-desktop = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./hosts/home-desktop/hardware-configuration.nix
          ]
          ++ sharedModules;
        };

        desktop = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./hosts/desktop/hardware-configuration.nix
          ]
          ++ sharedModules;
        };
      };
    };
}
