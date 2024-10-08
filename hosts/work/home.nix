{ pkgs, ... }:

# ██     ██  ██████  ██████  ██   ██ 
# ██     ██ ██    ██ ██   ██ ██  ██  
# ██  █  ██ ██    ██ ██████  █████   
# ██ ███ ██ ██    ██ ██   ██ ██  ██  
#  ███ ███   ██████  ██   ██ ██   ██ 

{

  # Allow Unfree
  nixpkgs.config = {
    allowUnfree = true;
  };

  # --- MODULARITY --- #
  imports = 
    [ 
      # Terminal
      ../../terminal/install.nix
    ];

  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages to install
  home.packages = with pkgs; [

    # Main
    calibre
    monero-gui
    pandoc
    signal-desktop
    texliveSmall

    # Terminal Programs
    powershell
    ollama
    mullvad-vpn
    xmrig
    yazi
 
    # Fun
    gimp
    handbrake
    inkscape
    obs-studio
    qFlipper
  ];
 
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
    autoconnect = ["qemu:///system"];
    uris = ["qemu:///system"];
    };
  };

  # Home Manager Version
  home.stateVersion = "24.05";
}
