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
      ../../apps/chromium.nix
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
    glow
    kitty
    pandoc
    pop
    signal-desktop
    texliveSmall
    ungoogled-chromium

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
    qFlipper
];
 
  # Home Manager Version
  home.stateVersion = "23.11";
}
