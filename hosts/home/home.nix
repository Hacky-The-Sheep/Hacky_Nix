{ inputs, pkgs, ... }:

<<<<<<< HEAD
# ██╗  ██╗ ██████╗ ███╗   ███╗███████╗
# ██║  ██║██╔═══██╗████╗ ████║██╔════╝
# ███████║██║   ██║██╔████╔██║█████╗  
# ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝  
# ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗
# ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝
=======
# ██       █████  ██████  
# ██      ██   ██ ██   ██ 
# ██      ███████ ██████  
# ██      ██   ██ ██      
# ███████ ██   ██ ██      
>>>>>>> 302083749d0ae3986951c56e072ef65e7cc77d78

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
      ../../terminal/swaylock.nix
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
<<<<<<< HEAD
    # swaylock-effects
=======
    swaylock-effects
>>>>>>> 302083749d0ae3986951c56e072ef65e7cc77d78
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
<<<<<<< HEAD
    starship
=======
>>>>>>> 302083749d0ae3986951c56e072ef65e7cc77d78
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
    
    # Fun
    mpv
    obs-studio
    qbittorrent
    rhythmbox
];
 
  # Home Manager Version
  home.stateVersion = "23.11";

  # Gnome Theming
  gtk.enable = true;
  
}
