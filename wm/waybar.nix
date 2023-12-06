{
  programs.waybar = {
    enable = true;

    settings = {
      layer = "top";
      position = "top";
      mod = "dock";
      exclusive = true;
      passthrough = false;
      gtk-layer-shell = true;
      height = 30;
      modules-left = [
        "hyprland/workspaces"
        "custom/game"
        "custom/home"
        "custom/work"
        ];
      modules-center = [
        "clock"
      ];
      "modules-right" = [
        "network"
        "bluetooth"
        "battery"
        "backlight"
        "pulseaudio"
        "pulseaudio#microphone"
        "user"
        "tray"
      ];
      "hyprland/window" = {
        "format" = "{}";
      };
      "hyprland/workspaces" = {
        "sort-by-name" = true;
        "format" = "{id}";
        "persistent-workspaces" = {
          "1" = [];
          "2" = [];
          "3" = [];
          "4" = [];
        };
      };
      "custom/game" = {
        format = "Game";
        on-click = "bash ~/.config/waybar/scripts/game_mode.sh";
      };
      "custom/home" = {
        format = "Home";
        on-click = "bash ~/.config/waybar/scripts/home_mode.sh";
      };
      "custom/work" = {
        format = "Work";
        on-click = "bash ~/.config/waybar/scripts/work_mode.sh";
      };
      "user" = {
        format = "{user}";
        spacing = 4;
        on-click = "bash ~/.config/waybar/scripts/power_menu.sh";
      };
      "tray" = {
        icon-size = 14;
        spacing = 4;
      };
      "clock" = {
        format = "{: %I:%M    %b %e, %y}";
        interval = 60;
      };
      "backlight" = {
        device = "intel_backlight";
        format = "{icon} {percent}%";
        format-icons = [
          ""
          ""
          ""
        ];
         on-scroll-up = "brightnessctl -q s 10%+";
         on-scroll-down = "brightnessctl -q s 10%-";
         disable-scroll = true;
         min-length = 5;
        };
        "network" = {
          format = "{ifname}";
          format-wifi = "{essid}";
          format-ethernet = "{ipaddr}";
        };
        "battery" = {
          states = {
            good = 100;
            warning = 30;
            critical = 20;
          };
          format = "{icon} {capacity}%";
          format-charging = "  {capacity}%";
          format-plugged = "  {capacity}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "pulseaudio" = {
          format = "{icon} {volume}%";
          tooltip = true;
          format-muted = " Muted";
          on-click = "pamixer -t";
          on-scroll-up = "pactl set-sink-volume @DEFAULT_SINK@ +10%";
          on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ -10%";
          scroll-step = 10;
          format-icons = {
            headphone = " ";
            hands-free = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = " ";
            default = [
              " "
              " "
              " "
            ];
          };
        };
        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = " Muted";
          on-click = "pamixer --default-source -t";
          on-scroll-up = "pamixer --default-source -i 5";
          on-scroll-down = "pamixer --default-source -d 5";
          scroll-step = 5;
        };
        "" = {
          format-disconnected = "Disconnected";
          format-wifi = "  {essid}";
          tooltip-format = "  {signalStrength}";
        };
        "bluetooth" = {
          format = " {status}";
          format-disabled = " {status}";
          format-connected = " {num_connections}";
          tooltip-format = "{device_alias}";
          tooltip-format-connected = " {device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
          on-click = "blueman-manager";
        };
        "memory" =  {
          interval = 1;
          format = "  {used}G ";
        };
        "disk" = {
          interval = 30;
          format = "  {free} / {total}";
        };
      };
    };
}
