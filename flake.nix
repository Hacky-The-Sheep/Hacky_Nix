{
  description = "Hacky's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    nix-colors.url = "github:misterio77/nix-colors";

  };

  outputs = { nixpkgs, home-manager, ...}@inputs: 
    let
      # ----- System Settings ----- #
      system = "x86_64-linux";      
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};

    in {
    nixosConfigurations = {
      hackyos = lib.nixosSystem {
        inherit system;
        # extraSpecialArgs = { inherit inputs ;};
        modules = [ 
        ./configuration.nix
        inputs.home-manager.nixosModules.default
        ];
      };
    };

    homeConfigurations = {
      hacky = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    };
  };
}
