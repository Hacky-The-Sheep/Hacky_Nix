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
    ];

  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  xdg.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # catppuccin.flavour = "mocha";
  
  # Packages to install
  home.packages = with pkgs; [

    # Main
    brave
    fastfetch
    kitty
    librewolf
    signal-desktop
    pop

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
    putty
    remmina
    
    # Fun
    mpv
    qbittorrent
    rhythmbox
];
 
  # Home Manager Version
  home.stateVersion = "24.05";

}
