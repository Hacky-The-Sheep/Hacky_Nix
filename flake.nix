{
  description = "Jon's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Testing
    stylix.url = "github:danth/stylix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, nixpkgs-stable, ...}@inputs: 
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

        # NVIDIA Gaming Laptop
        nvid_laptop = lib.nixosSystem {
          specialArgs = { 
            inherit pkgs;
            inherit system;
            inherit inputs;
            inherit pkgs-stable;
          };
          modules = [ 
            inputs.stylix.nixosModules.stylix
            ./hosts/nvid_laptop/hardware-configuration.nix
            ./configuration.nix
          ];
        };

        # Framework Laptop
        laptop = lib.nixosSystem {
          specialArgs = { 
            inherit pkgs;
            inherit system; 
            inherit inputs; 
            inherit pkgs-stable;
            hostname = "framenix";
          };
          modules = [ 
             home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.hacky = import ./hosts/laptop/home.nix;
            }
            inputs.stylix.nixosModules.stylix
            nixos-hardware.nixosModules.framework-13-7040-amd
            ./configuration.nix
            ./hosts/laptop/hardware-configuration.nix
          ];
        };

        # Work Beast
        work = lib.nixosSystem {
            inherit system;
            specialArgs = { 
              hostname = "worknix";
              inherit inputs;
              inherit pkgs;
              inherit pkgs-stable;
              inherit system;
            };
            modules = [
             home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "work_backup";
              home-manager.users.hacky = import ./hosts/work/home.nix;
            }
              inputs.stylix.nixosModules.stylix
              ./gpu/amd.nix
              ./hosts/work/hardware-configuration.nix
              ./configuration.nix
            ];
          };

        # Servers (Soon)
        server = lib.nixosSystem {
            inherit system;
            specialArgs = { 
              inherit inputs;
              inherit pkgs;
              inherit pkgs-stable;
              inherit system;
            };
            modules = [
               home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "backup";
                home-manager.users.hacky = import ./hosts/server/home.nix;
              }
              ./hosts/server/configuration.nix
            ];
          };

        home = lib.nixosSystem {
          specialArgs = { 
            hostname = "homenix";
            inherit system;
            inherit inputs;
            inherit pkgs-stable;
          };
          modules = [ 
             home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.hacky = import ./hosts/home/home.nix;
          }
            inputs.stylix.nixosModules.stylix
            ./configuration.nix
            ./hosts/home/hardware-configuration.nix
          ];
        };
      };

	# homeConfigurations = {
 #      	nvid_laptop = home-manager.lib.homeManagerConfiguration {
 #        	inherit pkgs;
 #        	extraSpecialArgs = { inherit inputs; };
 #        	modules = [ 
 #            ./hosts/nvid_laptop/home.nix 
 #          ];
 #      };
 #      	laptop = home-manager.lib.homeManagerConfiguration {
 #        	inherit pkgs;
 #        	extraSpecialArgs = { 
 #            inherit inputs; 
 #            inherit pkgs-stable; 
 #          };
 #        	modules = [ 
 #            ./hosts/laptop/home.nix 
 #          ];
 #      };
 #      	server = home-manager.lib.homeManagerConfiguration {
 #        	inherit pkgs;
 #        	extraSpecialArgs = { 
 #            inherit inputs; 
 #          };
 #        	modules = [ ./hosts/server/home.nix ];
 #      };
 #      	work = home-manager.lib.homeManagerConfiguration {
 #        	inherit pkgs;
 #        	extraSpecialArgs = { 
 #            inherit inputs; 
 #            inherit pkgs-stable;
 #          };
 #        	modules = [ 
 #            ./hosts/work/home.nix 
 #            ];
 #      };
 #      	home = home-manager.lib.homeManagerConfiguration {
 #        	inherit pkgs;
 #        	extraSpecialArgs = { 
 #            inherit inputs; 
 #          };
 #        	modules = [ 
 #            ./hosts/home/home.nix 
 #          ];
 #      };
 #    };
  };
}
