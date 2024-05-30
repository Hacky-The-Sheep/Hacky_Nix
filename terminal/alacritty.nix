{ lib, ...}:

{
  programs.alacritty = {
    enable = true;
    catppuccin.enable = true;

    settings = {
      window.opacity = lib.mkForce 0.90;
      font.normal = {
        family = "Iosevka";
        style = "Regular";
      };
      font.size = 16;
    };
  };
}
