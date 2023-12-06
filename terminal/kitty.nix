{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
    font.name = "Iosevka";  
    font.size = 15;
  };
}
