{ lib, ...}:

{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
    font.name = "Iosevka";  
    font.size = 15;
    shellIntegration.enableFishIntegration = true;
    settings = {
      background_opacity = lib.mkForce "0.95";
    };
  };
}
