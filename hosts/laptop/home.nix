{ pkgs, inputs, ... }:

# ██       █████  ██████  
# ██      ██   ██ ██   ██ 
# ██      ███████ ██████  
# ██      ██   ██ ██      
# ███████ ██   ██ ██      

{

  # --- MODULARITY --- #
  imports = 

    [

      inputs.nix-colors.homeManagerModules.default

      # Terminal
      ../../terminal/eza.nix
      ../../terminal/fish.nix
      ../../terminal/helix.nix
      ../../terminal/kitty.nix
      ../../terminal/lf.nix
      ../../terminal/zellij.nix
      ../../terminal/bat.nix
      ../../terminal/gitui.nix
      ../../terminal/git.nix
      ../../terminal/btop.nix

      # System
      ../../system/gtk.nix

      # WM
      ../../wm/hyprland.nix
      ../../wm/waybar.nix

      # Apps
      ../../apps/rofi.nix
      ../../apps/dunst.nix
      ../../apps/firefox.nix
    ];

  # Set the colorscheme
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  # colorScheme = inputs.nix-colors.colorSchemes.catppuccin-latte;

  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages to install
  home.packages = with pkgs; [

    # Main
    fastfetch
    signal-desktop
    simplex-chat-desktop
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
    swappy
    gitui
    btop
    swaylock
    swayidle

    # Coding
    go
    rustc
    cargo
    (python3.withPackages(ps: with ps; [ pandas requests numpy ruff mnamer ]))

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

  # Gnome Theming
  gtk.enable = true;
  
}
