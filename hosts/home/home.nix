{ inputs, pkgs, ... }:

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

      inputs.nix-colors.homeManagerModules.default

      # Terminal
      ../../terminal/install.nix

      # System
      ../../system/gtk.nix

      # Hyprland
      ../../apps/dunst.nix
      ../../apps/rofi.nix
      ../../wm/hyprland_home.nix
      ../../wm/waybar_home.nix

      # Apps
      ../../apps/firefox.nix
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
    brave
    cava
    fastfetch
    firefox
    kitty
    signal-desktop
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

    # Catppuccin 😹
    catppuccin-gtk

    # Terminal Programs
    openvpn
    ripgrep
    vscode-langservers-extracted
    yt-dlp

    # Coding
    go
    (python3.withPackages(ps: with ps; [ pandas requests numpy ruff ]))

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
    spicetify-cli
];
 
  # Home Manager Version
  home.stateVersion = "23.11";

}
