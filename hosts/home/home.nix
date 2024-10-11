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
    ];

  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  # Stylix
  stylix.targets.helix.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
    
  # Packages to install
  home.packages = with pkgs; [

    # Main
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
