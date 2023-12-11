{ pkgs, config, lib, ...}:

{
  programs.kitty = {
    enable = true;
    # theme = "Catppuccin-Mocha";
    font.name = "Iosevka";  
    font.size = 15;
    shellIntegration.enableFishIntegration = true;
    settings = {
      background_opacity = lib.mkForce "0.95";

      # Theming
      background = "#${config.colorScheme.colors.base01}";
      foreground = "#${config.colorScheme.colors.base05}";
      selection_foreground = "#${config.colorScheme.colors.base01}";
      selection_background = "#${config.colorScheme.colors.base06}";

      cursor = "#${config.colorScheme.colors.base06}";
      cursor_text_color = "#${config.colorScheme.colors.base00}";

      url_color = "#${config.colorScheme.colors.base06}";

      active_border_color = "#${config.colorScheme.colors.base07}";
      inactive_border_color = "#${config.colorScheme.colors.base01}";
      bell_border_color = "#${config.colorScheme.colors.base0A}";

      mark1_foreground = "${config.colorScheme.colors.base01}";
      mark1_background = "${config.colorScheme.colors.base07}";
      mark2_foreground = "${config.colorScheme.colors.base01}";
      mark2_background = "${config.colorScheme.colors.base0E}";
      mark3_foreground = "${config.colorScheme.colors.base01}";
      mark3_background = "${config.colorScheme.colors.base0F}";
    };
  };
}
