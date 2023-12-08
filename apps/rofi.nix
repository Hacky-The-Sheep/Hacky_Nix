{ config, ...}:

let
  inherit (config.lib.formats.rasi) mkLiteral;
  catppuccin_mocha = {
    "*" = {
      background-color = mkLiteral "#1e1e2e";
      border-color = mkLiteral "#1e1e2e";
      selected-color = mkLiteral "#1e1e2e";
    };
  };
in {
  programs.rofi = {
    enable = true;
    theme = catppuccin_mocha;
  };
}
