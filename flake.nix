{
  description = "Jon's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    # hyprland.url = "github:hyprwm/Hyprland";
    # sops-nix.url = "github:Mic92/sops-nix";
    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, catppuccin, home-manager, nixpkgs-unstable, ...}@inputs: 
    let
      # ----- System Settings ----- #
      system = "x86_64-linux";      
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = import nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree=true;
      };

    in {	
      nixosConfigurations = {

        nvid_laptop = lib.nixosSystem {
          specialArgs = { inherit system inputs; };
          modules = [
            ./hosts/nvid_laptop/configuration.nix
          ];
        };

        laptop = lib.nixosSystem {
          specialArgs = { 
            inherit system; 
            inherit inputs; 
            inherit pkgs-unstable;
          };
          modules = [ 
            ./hosts/laptop/configuration.nix
          ];
        };

        work = lib.nixosSystem {
            inherit system;
            specialArgs = { 
              inherit inputs;
              inherit pkgs-unstable;
            };
            modules = [
              ./hosts/work/configuration.nix
            ];
          };

        server = lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs; };
            modules = [
              ./hosts/server/configuration.nix
            ];
          };

        home = lib.nixosSystem {
          specialArgs = { 
            inherit system;
            inherit inputs;
            inherit pkgs-unstable;
          };
          modules = [ 
            ./hosts/home/configuration.nix
          ];
        };
      };

	homeConfigurations = {
      	nvid_laptop = home-manager.lib.homeManagerConfiguration {
        	inherit pkgs;
        	extraSpecialArgs = { inherit inputs; };
        	modules = [ ./hosts/nvid_laptop/home.nix ];
      };
      	laptop = home-manager.lib.homeManagerConfiguration {
        	inherit pkgs;
        	extraSpecialArgs = { inherit inputs; };
        	modules = [ 
            catppuccin.homeManagerModules.catppuccin
          ./hosts/laptop/home.nix ];
      };
      	server = home-manager.lib.homeManagerConfiguration {
        	inherit pkgs;
        	extraSpecialArgs = { inherit inputs; };
        	modules = [ ./hosts/server/home.nix ];
      };
      	work = home-manager.lib.homeManagerConfiguration {
        	inherit pkgs;
        	extraSpecialArgs = { inherit inputs; };
        	modules = [ 
            catppuccin.homeManagerModules.catppuccin
            ./hosts/work/home.nix 
            ];
      };
      	home = home-manager.lib.homeManagerConfiguration {
        	inherit pkgs;
        	extraSpecialArgs = { inherit inputs; };
        	modules = [ ./hosts/home/home.nix ];
      };
    };
  };
}
