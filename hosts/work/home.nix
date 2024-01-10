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

      inputs.nix-colors.homeManagerModules.default

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

    # Catppuccin 😹
    catppuccin-gtk

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
    vscode-langservers-extracted
    yazi
    yt-dlp

    # Coding
    go
    rustc
    cargo
    (python3.withPackages(ps: with ps; [ pandas requests numpy ruff ]))
    mnamer

    # "Work"
    libreoffice
    mullvad-vpn
    remmina
    
    # Fun
    libsForQt5.kdenlive
    inkscape
    mpv
    obs-studio
    # qbittorrent
    # rhythmbox
];
 
  # Home Manager Version
  home.stateVersion = "23.11";
}
