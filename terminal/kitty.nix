{ lib, ...}:

{
  programs.kitty = {
    enable = true;
    font.name = "Iosevka";  
    font.size = 16;
    shellIntegration.enableFishIntegration = true;
    theme = "Catppuccin-Mocha";
    settings = {
      background_opacity = lib.mkForce "0.90";
    };
  };
}
