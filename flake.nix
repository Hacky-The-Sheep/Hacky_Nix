{
  description = "Hacky's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    nix-colors.url = "github:misterio77/nix-colors";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
        modules = [ 
        ./configuration.nix
        inputs.hyprland.nixosModules.default
        {programs.hyprland.enable = true;}
        ];
      };
    };

    homeConfigurations = {
      hacky = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs ;};
        modules = [ ./home.nix ];
      };
    };
  };
}
