{ pkgs, ... }:

# ██     ██  ██████  ██████  ██   ██ 
# ██     ██ ██    ██ ██   ██ ██  ██  
# ██  █  ██ ██    ██ ██████  █████   
# ██ ███ ██ ██    ██ ██   ██ ██  ██  
#  ███ ███   ██████  ██   ██ ██   ██ 

{

  # --- MODULARITY --- #
  imports = 
    [ 
      # Terminal
      ../../terminal/install.nix

      # System
      ../../system/ssh.nix

      # Hyprland
      ../../apps/dunst.nix
      ../../apps/rofi.nix
      ../../wm/hyprland.nix
      ../../wm/waybar.nix

      # Apps
      ../../apps/firefox.nix
    ];

  # Catppuccin
  catppuccin.flavor = "mocha";

  # Must be enabled for cat/nix to work
  xdg.enable = true;

  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages to install
  home.packages = with pkgs; [

    # Main
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
    inkscape
    gimp
    obs-studio
    handbrake
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
