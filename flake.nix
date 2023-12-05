{
  description = "Hacky's Flake";

  outputs = { self, nixpkgs, home-manager, nur, ...}: 
    let 

      # ----- System Settings ----- #
      system = "x86_64-linux";
      hostname = "hackyos";
      timezone = "America/Chicago";
      locale = "en_US.UTF-8";

      # ----- User Settings ----- #
      username = "hacky";
      name = "Jon";
      email = "jon.nguyen7@protonmail.com";
      dotfilesDir = "~/.dotfiles";
      wm = "hyprland";
      term = "kitty";
      font = "Iosevka";
      fontPkg = pkgs.iosevka;
      
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};

    in {

    nixosConfigurations = {
      hackyos = lib.nixosSystem {
        inherit system;
        modules = [ 
        ./configuration.nix 
        nur.nixosModules.nur ];
        specialArgs = {          
            inherit system;
            inherit hostname;
            inherit timezone;
            inherit locale;
            inherit username;
            inherit name;
            inherit email;
            inherit dotfilesDir;
            inherit wm;
            inherit term;
            inherit font;
        };
      };
    };

    homeConfigurations = {
      hacky = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        specialArgs = {          
            inherit system;
            inherit hostname;
            inherit timezone;
            inherit locale;
            inherit username;
            inherit name;
            inherit email;
            inherit dotfilesDir;
            inherit wm;
            inherit term;
            inherit font;
        };
      };
    };
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = github:nix-community/NUR;
  };

}
