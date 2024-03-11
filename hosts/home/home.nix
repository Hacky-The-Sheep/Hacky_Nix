{ pkgs, ... }:

# ██╗  ██╗ ██████╗ ███╗   ███╗███████╗
# ██║  ██║██╔═══██╗████╗ ████║██╔════╝
# ███████║██║   ██║██╔████╔██║█████╗  
# ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝  
# ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗
# ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝

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
    fastfetch
    kitty
    signal-desktop
    xdg-desktop-portal-hyprland
    pop

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
    openvpn
    ripgrep
    yt-dlp

    # Pentesting
    ffuf
    gobuster
    john
    nmap
    rlwrap
    thc-hydra

    # "Work"
    libreoffice
    mullvad-vpn
    
    # Fun
    mpv
    obs-studio
    qbittorrent
    rhythmbox
    qFlipper
];
 
  # Home Manager Version
  home.stateVersion = "23.11";
}
