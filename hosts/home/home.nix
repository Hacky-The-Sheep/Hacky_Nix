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

  # Catppuccin
  # catppuccin = {
  #   enable = true;
  #   flavor = "mocha";
  #   accent = "sky";
  #   pointerCursor = {
  #     accent = "rosewater";
  #   };
  # };
  # gtk.enable = true;
  # gtk.catppuccin = {
  #   enable = true;
  #   accent = "sky";
  #   flavor = "mocha";
  #   gnomeShellTheme = true;
  #   icon = {
  #     enable = true;
  #     accent = "peach";
  #   };
  # };

  # Stylix
  stylix.targets.helix.enable = true;

  # Must be enabled for cat/nix to work
  # xdg.enable = true;

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
