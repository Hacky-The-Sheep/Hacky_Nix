{
  description = "Hacky's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    nix-colors.url = "github:misterio77/nix-colors";

  };

  outputs = { self, nixpkgs, ...}@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};

    in {
      nixosConfigurations = {
        hackyos = lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;

          modules = [
            ./configuration.nix
            inputs.hyprland.nixosModules.default
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}
