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
    base16.url = "github:SenchoPens/base16.nix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, base16, ...}@inputs: 
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
            base16.nixosModule
            { scheme = "${inputs.base16-scheme}/catppuccin-mocha"; }
            ./hosts/laptop/configuration.nix
          ];
        };

        work = lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs; };
            modules = [
              base16.nixosModule
              { scheme = "${inputs.base16-scheme}/catppuccin-mocha"; }
              ./hosts/work/configuration.nix
            ];
          };

        server = lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs; };
            modules = [
              base16.nixosModule
              { scheme = "${inputs.base16-scheme}/catppuccin-mocha"; }
              ./hosts/server/configuration.nix
            ];
          };

        home = lib.nixosSystem {
          specialArgs = { inherit system inputs; };
          modules = [ 
            base16.nixosModule
            { scheme = "${inputs.base16-scheme}/catppuccin-mocha"; }
            ./hosts/home/configuration.nix
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
      	work = home-manager.lib.homeManagerConfiguration {
        	inherit pkgs;
        	extraSpecialArgs = { inherit inputs ;};
        	modules = [ ./hosts/work/home.nix ];
      };
      	home = home-manager.lib.homeManagerConfiguration {
        	inherit pkgs;
        	extraSpecialArgs = { inherit inputs ;};
        	modules = [ ./hosts/home/home.nix ];
      };
    };
  };
}
