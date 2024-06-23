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
      # ../../apps/firefox.nix

      # Hyprland
      ../../apps/dunst.nix
      ../../apps/rofi.nix
      ../../wm/hyprland.nix
      ../../wm/waybar.nix
    ];

  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  # Must be enabled for cat/nix to work
  xdg.enable = true;

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
    monero-gui
    pandoc
    pop
    signal-desktop
    texliveSmall
    thunderbird
    
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

    # Testing!
    typst
    typstfmt
    typst-lsp
    typst-live
    
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
    # Fun
    mpv
    obs-studio
    qbittorrent
    qFlipper
    rhythmbox
];
 
  # Home Manager Version
  home.stateVersion = "24.05";
}
