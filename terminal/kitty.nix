{ lib, ...}:

{
  programs.kitty = {
    enable = true;
    font.name = "Iosevka";  
    font.size = 16;
    shellIntegration.enableFishIntegration = true;
    catppuccin.enable = true;
    settings = {
      background_opacity = lib.mkForce "0.90";
    };
  };
}
