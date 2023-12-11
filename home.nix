{ pkgs, inputs, ... }:

{

  # --- MODULARITY --- #
  imports = 
    [ 
      # Flake Inputs
      inputs.nix-colors.homeManagerModules.default
      # Terminal
      ./terminal/eza.nix
      ./terminal/fish.nix
      ./terminal/helix.nix
      ./terminal/kitty.nix
      ./terminal/lf.nix
      ./terminal/zellij.nix
      # System
      ./system/gtk.nix
      # WM
      ./wm/hyprland.nix
      ./wm/waybar.nix
      # Apps
      ./apps/rofi.nix
      ./apps/dunst.nix
    ];

  # Set the colorscheme
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages to install
  home.packages = with pkgs; [

    # Main
    fastfetch
    signal-desktop
    timeshift
    brave
    firefox
    rofi
    swww
    kitty

    # Catppuccin 😹
    catppuccin-gtk

    # Terminal Programs
    helix
    lf
    htop
    eza
    yt-dlp
    bat
    ripgrep
    rofimoji
    dunst
    slurp
    grim

    # Coding
    go
    rustc
    cargo
    (python3.withPackages(ps: with ps; [ pandas requests numpy ruff mnamer]))

    # "Work"
    libreoffice
    mullvad-vpn
    remmina
    
    # Fun
    rhythmbox
    mpv
    inkscape
    obs-studio
    qbittorrent
];
 
  # Home Manager Version
  home.stateVersion = "23.11";

  programs.git = {
    enable = true;
    userName = "Hacky-The-Sheep";
    userEmail = "jon.nguyen7@protonmail.com";
  };

  # Gnome Theming
  gtk.enable = true;
  
}
