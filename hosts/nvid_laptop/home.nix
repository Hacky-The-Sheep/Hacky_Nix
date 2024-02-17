{ inputs, pkgs, ... }:

# ██       █████  ██████  
# ██      ██   ██ ██   ██ 
# ██      ███████ ██████  
# ██      ██   ██ ██      
# ███████ ██   ██ ██      

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
    ];

  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages to install
  home.packages = with pkgs; [

    # Main
    brave
    cava
    fastfetch
    firefox
    kitty
    signal-desktop
    timeshift
    xdg-desktop-portal-hyprland

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
    yazi
    yt-dlp

    # "Work"
    libreoffice
    mullvad-vpn
    remmina
    
    # Fun
    inkscape
    mpv
    obs-studio
    qbittorrent
    rhythmbox
];
 
  # Home Manager Version
  home.stateVersion = "23.11";
}
