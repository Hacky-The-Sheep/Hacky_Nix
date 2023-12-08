{ config, ...}:

let
  inherit (config.lib.formats.rasi) mkLiteral;
  catppuccin_mocha = {
    "*" = {
      background-color = mkLiteral "#00ff00";
    };
  };
in {
  programs.rofi = {
    enable = true;
    theme = catppuccin_mocha;
  };
}
