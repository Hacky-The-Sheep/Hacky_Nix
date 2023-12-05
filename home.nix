{ config, pkgs, ... }:

{
  home.username = "hacky";
  home.homeDirectory = "/home/hacky";

  # Packages to install
#   home.packages = [
# 	pkgs.htop
# 	pkgs.fastfetch
# 	pkgs.lf
# 	pkgs.signal-desktop
# 	pkgs.timeshift
# 	pkgs.mullvad-vpn
# ];
 
  # Home Manager Version
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Hacky-The-Sheep";
    userEmail = "jon.nguyen7@protonmail.com";
  };
}
