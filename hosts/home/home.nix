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

      # Hyprland
      # ../../apps/dunst.nix
      # ../../apps/rofi.nix
      # ../../wm/hyprland.nix
      # ../../wm/waybar.nix
      # ../../apps/hyprlock.nix
    ];

  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  # Must be enabled for cat/nix to work
  xdg.enable = true;

  # SSH
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
    
  # Packages to install
  home.packages = with pkgs; [

    # Main
    # monero-gui
    pandoc
    pop
    signal-desktop
    thunderbird
    
    # Testing!
    typst
    typstfmt
    typst-lsp
    typst-live

    # Fun
    # obs-studio
    qFlipper
];
 
  # Home Manager Version
  home.stateVersion = "24.05";
}
