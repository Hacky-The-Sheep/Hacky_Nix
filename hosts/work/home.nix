{ pkgs, ... }:

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
      # ../../apps/dunst.nix
      # ../../apps/rofi.nix
      # ../../wm/hyprland.nix
      # ../../wm/waybar.nix

      # Apps
      ../../apps/firefox.nix
    ];

  # Catppuccin
  catppuccin.flavour = "mocha";

  # Must be enabled for cat/nix to work
  xdg.enable = true;

  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages to install
  home.packages = with pkgs; [


    # Main
    brave
    fastfetch
    glow
    kitty
    librewolf
    pandoc
    signal-desktop
    texliveSmall
    xdg-desktop-portal-hyprland
    zathura

    # Hyprland Packages
    brightnessctl
    dunst
    grim
    mpvpaper
    polkit_gnome
    rofi
    rofimoji
    slurp
    swappy
    swaylock-effects
    swww

    # Terminal Programs
    bat
    btop
    eza
    gitui
    helix
    htop
    lf
    ollama
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
    gnome-network-displays
    
    # Pentesting
    ffuf
    gobuster
    john
    nmap
    rlwrap
    thc-hydra

    # Fun
    inkscape
    gimp
    mpv
    obs-studio
    handbrake
    rhythmbox
];
 
  # Home Manager Version
  home.stateVersion = "23.11";
}
