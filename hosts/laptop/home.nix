{ pkgs, ... }:

{
  # --- MODULARITY --- #
  imports = 
    [
      # Terminal
      ../../terminal/install.nix
      ../../system/ssh.nix
    ];

  # Home
  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  xdg.enable = true;

  # Catppuccin
  catppuccin.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages to install
  home.packages = with pkgs; [
    signal-desktop
];
 
  # Home Manager Version
  home.stateVersion = "24.05";
}
