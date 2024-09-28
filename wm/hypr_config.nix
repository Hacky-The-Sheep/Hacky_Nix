{ pkgs, ...}:

{  
  # Hyprland
  security.pam.services = {
    login.enableGnomeKeyring = true;
  };
  programs.hyprlock.enable = true;

   # Cachix
  nix.settings = {
   substituters = ["https://hyprland.cachix.org"];
   trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  environment.systemPackages = with pkgs; [
    # Hyprland    
    brightnessctl
    dunst
    grim
    hyprlock
    polkit_gnome
    rofi
    rofimoji
    slurp
    swappy
    swww
  ];

}
