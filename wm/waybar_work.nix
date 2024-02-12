{
  programs.waybar = {
    enable = true;

    # -- The Bar -- #
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        height = 30;

        modules-left = [
          "hyprland/workspaces"
          "memory"
          "custom/work"
          ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "network"
          "bluetooth"
          "backlight"
          "pulseaudio"
          "pulseaudio#microphone"
          "user"
          "tray"
        ];

        "hyprland/window" = {
          "format" = "󰊠";
        };

        "hyprland/workspaces" = {
          "sort-by-name" = true;
          "format" = "󰊠";
          "persistent-workspaces" = {
            "1" = "󱙝";
            "2" = "󱙝";
            "3" = "󱙝";
            "4" = "󱙝";
          };
        };

        "memory" = {
          "interval" = 15;
          "format" = "{}%";
          "max-length" = 10;
        };

        "custom/work" = {
          format = "Work";
          on-click = "bash ~/scripts/work_mode.sh";
        };

        "user" = {
          format = "{user}";
          spacing = 4;
          on-click = "bash ~/scripts/power_menu.sh";
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
            "🌑"
            "🌤️"
            "☀️"
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
            on-click = "nm-applet";
          };

          "pulseaudio" = {
            format = "{icon} {volume}%";
            tooltip = true;
            format-muted = "󰝟 Muted";
            on-scroll-up = "amixer -D pipewire sset Master 5%+";
            on-scroll-down = "amixer -D pipewire sset Master 5%-";
            on-click = "amixer set Master toggle";
            scroll-step = 5;
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
            format-source = " {volume}%";
            format-source-muted = " Muted";
            on-scroll-up = "amixer -D pipewire sset Capture 5%+";
            on-scroll-down = "amixer -D pipewire sset Capture 5%-";
            on-click = "amixer set Capture toggle";
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
        };
      };

    # -- The Styling -- #
    style = ''
      * {
          border: none;
          border-radius: 0;
          font-family: "Iosevka";
          font-weight: bold;
          font-size: 15px;
          min-height: 0;
      }

      window#waybar {
          background: rgba(21, 18, 27, 0);
          color: #cdd6f4;
      }

      tooltip {
          background: #000000;
          border-radius: 10px;
          border-width: 0px;
          border-style: solid;
          border-color: #11111b;
      }

      #workspaces button {
          padding: 2px;
          padding-left: 5px;
          color: #6c7086;
          margin-right: 5px;
          margin-left: 5px;
      }

      #workspaces button.active {
          color: #f5e0dc;
      }

      #workspaces button.focused {
          color: #a6adc8;
          background: #eba0ac;
          border-radius: 10px;
      }

      #workspaces button.urgent {
          color: #11111b;
          background: #a6e3a1;
          border-radius: 15px;
      }

      #workspaces button:hover {
          background: #11111b;
          color: #cdd6f4;
          border-radius: 15px;
      }

      #window,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #bluetooth,
      #workspaces,
      #tray,
      #memory,
      #user,
      #custom-work,
      #backlight {
          background: #000000;
          opacity: 1.0;
          padding: 0px 10px;
          margin: 0px 0px;
          margin-top: 5px;
          border: 1px solid #181825;
      }

      #backlight {
          border-radius: 10px 0px 0px 10px;
      }

      #tray {
          border-radius: 10px;
          margin-right: 10px;
      }

      #workspaces {
          background: #000000;
          border-radius: 10px;
          margin-left: 0px;
          padding-right: 0px;
          padding-left: 3px;
      }

      #window {
          border-radius: 10px;
          margin-left: 60px;
          margin-right: 60px;
      }

      #clock {
          color: #fab387;
          border-radius: 20px 20px 20px 20px;
          margin-left: 0px;
          border-right: 0px;
      }

      #network {
          color: #f9e2af;
          border-radius: 10px 10px 10px 10px;
          border-left: 0px;
          border-right: 0px;
          margin-left: 10px;
      }

      #memory {
          color: #89b4fa;
          border-radius: 10px 10px 10px 10px;
          border-left: 0px;
          border-right: 0px;
          margin-left: 5px;
      }

      #disk {
          color: #a6e3a1;
          border-radius: 10px 10px 10px 10px;
          border-left: 0px;
          border-right: 0px;
          margin-left: 5px;
      }


      #bluetooth {
          color: #89dceb;
          border-radius: 10px 10px 10px 10px;
          margin-left: 10px;
      } 

      #pulseaudio {
          color: #74c7ec;
          border-left: 0px;
          border-right: 0px;
      }

      #pulseaudio.microphone {
          color: #89b4fa;
          border-left: 0px;
          border-right: 0px;
      }

      #battery {
          color: #a6e3a1;
          border-radius: 10px 10px 10px 10px;
          margin-right: 10px;
          border-left: 0px;
      }

      #battery.critical:not(.charging) {

      background-color:           #F53C3C;
      color:                      #f38ba8;
      animation-name:             blink;
      animation-duration:         0.5s;
      animation-timing-function:  linear;
      animation-iteration-count:  infinite;
      animation-direction:        alternate;

      }

      #user {
          color: #cba6f7;
          border-radius: 0px 10px 10px 0px;
          margin-right: 5px;
      }

      #custom-work {
          color: #74c7ec;
          border-radius: 10px 10px 10px 10px;
          margin-right: 5px;
          border-left: 5px;
      }
    '';
    };
}
