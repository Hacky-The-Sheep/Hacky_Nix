{
  description = "Hacky's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = github:nix-community/NUR;

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nur, spicetify-nix, ...}: 
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
