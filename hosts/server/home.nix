{ pkgs, inputs, ... }:

# ███████ ███████ ██████  ██    ██ ███████ ██████  
# ██      ██      ██   ██ ██    ██ ██      ██   ██ 
# ███████ █████   ██████  ██    ██ █████   ██████  
#      ██ ██      ██   ██  ██  ██  ██      ██   ██ 
# ███████ ███████ ██   ██   ████   ███████ ██   ██ 

{

  # --- MODULARITY --- #
  imports = 
    [ 
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
      # ./wm/hyprland.nix
      # ./wm/waybar.nix

      # Apps
      # ./apps/rofi.nix
      # ./apps/dunst.nix
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
    # signal-desktop
    timeshift
    # brave
    firefox
    # rofi
    # swww
    kitty

    # Catppuccin 😹
    catppuccin-gtk

    # Terminal Programs
    fastfetch
    helix
    lf
    htop
    eza
    # yt-dlp
    bat
    ripgrep
    # rofimoji
    # dunst
    # slurp
    # grim
    # swappy
    gitui

    # Coding
    # go
    # rustc
    # cargo
    (python3.withPackages(ps: with ps; [ pandas requests numpy ruff ]))

    # "Work"
    # libreoffice
    # mullvad-vpn
    remmina
    
    # Fun (No fun on the sever)
    # rhythmbox
    # mpv
    # inkscape
    # obs-studio
    # qbittorrent
];
 
  # Home Manager Version
  home.stateVersion = "23.11";

  # Gnome Theming
  gtk.enable = true;
  
}
