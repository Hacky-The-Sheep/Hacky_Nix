{ pkgs, inputs, ... }:

# ██     ██  ██████  ██████  ██   ██ 
# ██     ██ ██    ██ ██   ██ ██  ██  
# ██  █  ██ ██    ██ ██████  █████   
# ██ ███ ██ ██    ██ ██   ██ ██  ██  
#  ███ ███   ██████  ██   ██ ██   ██ 

{

  # --- MODULARITY --- #
  imports = 
    [ 
      # Terminal
      ../../terminal/install.nix

      # System
      ../../system/gtk.nix

      # Hyprland
      ../../apps/dunst.nix
      ../../apps/rofi.nix
      ../../wm/hyprland.nix
      ../../wm/waybar.nix

      # Apps
      # ../../apps/firefox.nix
    ];

  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages to install
  home.packages = with pkgs; [


    # Main
    brave
    fastfetch
    firefox
    kitty
    timeshift
    xdg-desktop-portal-hyprland
    librewolf

    # Hyprland Packages
    brightnessctl
    dunst
    grim
    mpvpaper
    rofi
    rofimoji
    slurp
    swappy
    swaylock-effects
    swww

    # Catppuccin 😹
    # catppuccin-gtk

    # Terminal Programs
    bat
    btop
    eza
    gitui
    helix
    htop
    lf
    openvpn
    ripgrep
    sops
    vscode-langservers-extracted
    yazi
    yt-dlp

    # "Work"
    libreoffice
    mullvad-vpn
    remmina
    
    # Pentesting
    ffuf
    gobuster
    john
    nmap
    rlwrap
    thc-hydra

    # Fun
    libsForQt5.kdenlive
    inkscape
    mpv
    obs-studio
    handbrake
    # qbittorrent
    rhythmbox
];
 
  # Home Manager Version
  home.stateVersion = "23.11";
}
