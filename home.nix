{ config, pkgs, ... }:

{

  # --- MODULARITY --- #
  imports = 
    [ ./terminal/kitty.nix 
      ./terminal/fish.nix
      ./terminal/zellij.nix
      ./terminal/helix.nix
      ./terminal/lf.nix
      ./terminal/eza.nix
      ./wm/hyprland.nix
      ./wm/waybar.nix
    ];
  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages to install
  home.packages = with pkgs; [

    # Main
    htop
    fastfetch
    lf
    signal-desktop
    timeshift
    brave
    firefox
    rofi
    swww
    helix
    kitty

    # Coding
    go
    rustc
    cargo
    (python3.withPackages(ps: with ps; [ pandas requests numpy ruff mnamer]))
    eza

    # "Work"
    libreoffice
    mullvad-vpn
    remmina
    
    # Fun
    rhythmbox
    mpv
    inkscape
    obs-studio
    yt-dlp
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
