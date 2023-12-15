{
  description = "Jon's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    nix-colors.url = "github:misterio77/nix-colors";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs: 
    let

      # ----- System Settings ----- #
      system = "x86_64-linux";      
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};

    in {	
      nixosConfigurations = {

        laptop = lib.nixosSystem {
          specialArgs = { inherit system inputs; };
          modules = [ 
            ./hosts/laptop/configuration.nix
            inputs.hyprland.nixosModules.default
            {programs.hyprland.enable = true;}
          ];
        };

        desktop = lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs; };
            modules = [
              ./hosts/work_desktop/configuration.nix
              inputs.hyprland.nixosModules.default
              {programs.hyprland.enable = true;}
            ];
          };

        server = lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs; };
            modules = [
              ./hosts/server/configuration.nix
            ];
          };
        };
	homeConfigurations = {
      	laptop = home-manager.lib.homeManagerConfiguration {
        	inherit pkgs;
        	extraSpecialArgs = { inherit inputs ;};
        	modules = [ ./hosts/laptop/home.nix ];
      };
      	server = home-manager.lib.homeManagerConfiguration {
        	inherit pkgs;
        	extraSpecialArgs = { inherit inputs ;};
        	modules = [ ./hosts/server/home.nix ];
      };
      	desktop = home-manager.lib.homeManagerConfiguration {
        	inherit pkgs;
        	extraSpecialArgs = { inherit inputs ;};
        	modules = [ ./hosts/desktop/home.nix ];
      };
    };
    };
  }
