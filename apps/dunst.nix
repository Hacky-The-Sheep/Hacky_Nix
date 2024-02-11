{ config, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        origin = "top-center";
        follow = "mouse";
        monitor = 0;
        width = 300;
        height = 600;
        background = "#1E1E2E";
        foreground = "CDD6F4";
        timeout = 10;
        font = "Iosevka 14";
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "center";
        vertical_alignment = "center";
        show_indicators = "yes";
        
        # Show icons
        enable_recursive_icon_lookup = true;
        icon_position = "left";
        min_icon_size = 32;

        corner_radius = 20;

        # Mouse Settings
        mouse_left_click = "context";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };
    };   
  };
}
