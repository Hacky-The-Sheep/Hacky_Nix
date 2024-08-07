{
  description = "Jon's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, catppuccin, home-manager, nixos-hardware, nixpkgs-stable, ...}@inputs: 
    let
      # ----- System Settings ----- #
      system = "x86_64-linux";      
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-stable = import nixpkgs-stable {
        system = "x86_64-linux";
        config.allowUnfree=true;
      };

    in {	
      nixosConfigurations = {

        amd = lib.nixosSystem {
          specialArgs = {
            inherit system; 
            inherit inputs;
            inherit pkgs-stable;
          };
          modules = [
          catppuccin.nixosModules.catppuccin
            ./configuration.nix
            ./gpu/amd.nix
          ];
        };
        nvid_laptop = lib.nixosSystem {
          specialArgs = { inherit system inputs; };
          modules = [
            ./hosts/nvid_laptop/hardware-configuration.nix
          ];
        };

        laptop = lib.nixosSystem {
          specialArgs = { 
            inherit system; 
            inherit inputs; 
            inherit pkgs-stable;
          };
          modules = [ 
            nixos-hardware.nixosModules.framework-13-7040-amd
            catppuccin.nixosModules.catppuccin
            ./hosts/laptop/hardware-configuration.nix
            ./configuration.nix
          ];
        };

        work = lib.nixosSystem {
            inherit system;
            specialArgs = { 
              inherit inputs;
              inherit pkgs-stable;
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
            inherit pkgs-stable;
          };
          modules = [ 
            catppuccin.nixosModules.catppuccin
            ./hosts/home/hardware-configuration.nix
            ./configuration.nix
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
        	extraSpecialArgs = { 
            inherit inputs; 
            inherit pkgs-stable; 
          };
        	modules = [ 
            catppuccin.homeManagerModules.catppuccin
            nixos-hardware.nixosModules.framework-13-7040-amd
            ./hosts/laptop/home.nix 
          ];
      };
      	server = home-manager.lib.homeManagerConfiguration {
        	inherit pkgs;
        	extraSpecialArgs = { 
            inherit inputs; 
          };
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
        	extraSpecialArgs = { 
            inherit inputs; 
          };
        	modules = [ 
            catppuccin.homeManagerModules.catppuccin
            ./hosts/home/home.nix 
          ];
      };
    };
  };
}
