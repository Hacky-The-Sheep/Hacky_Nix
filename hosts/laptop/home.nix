{ pkgs, ... }:

{
  # --- MODULARITY --- #
  imports = 
    [
      # Terminal
      ../../terminal/install.nix

      # System
      # ../../system/gtk.nix

      # Hyprland
      ../../apps/dunst.nix
      ../../apps/rofi.nix
      ../../wm/hyprland.nix
      ../../wm/waybar.nix
      ../../apps/hyprlock.nix

    ];

  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  xdg.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages to install
  home.packages = with pkgs; [


    # Terminal Programs
    # Fun
    mpv
    # qbittorrent
    # rhythmbox
];
 
  # Home Manager Version
  home.stateVersion = "24.05";

}
