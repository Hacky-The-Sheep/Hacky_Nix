{ lib, ...}:

{
  programs.kitty = {
    enable = true;
    font.name = lib.mkForce "Iosevka";
    font.size = lib.mkForce 16;
    shellIntegration.enableFishIntegration = true;
    settings = {
      background_opacity = lib.mkForce "0.90";
    };
  };
}
