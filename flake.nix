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
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
}
#     let
#       # ----- System Settings ----- #
#       system = "x86_64-linux";      
#       pkgs = nixpkgs.legacyPackages.${system};

#     in {
#       # nixosConfigurations.default = nixpkgs.lib.nixosSystem {
#       #   inherit system;
#       #   specialArgs = { inherit inputs; };
#       #   modules = [ 
#       #     ./configuration.nix 
#       #     inputs.home-manager.nixosModules.default
#       #     ];
#       # };
#       nixosConfigurations = {
#         hackyos = lib.nixosSystem {
#         inherit system;
#         modules = [ ./configuration.nix ];
#       };
#     };

#     # home-manager = {
#     #   # specialArgs = { inherit inputs; };
#     #   users = {
#     #     "username" = import ./home.nix;
#     #   };
#     # };
#   # };
# }
