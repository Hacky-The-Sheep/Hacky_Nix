{
wayland.windowManager.hyprland = {
  enable = true;
  enableNvidiaPatches = true;

  settings = {
    exec-once = [
      "waybar"
      "dunst"
      "swww init"
      "NetworkManager"
      "synology-drive"
      "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/cat_wave.png"
    ];
    source = "~/Hacky_Nix/themes/mocha.conf";

    # Set the default monitor
    monitor = ", highrr, 0x0, 1";

    env = "XCURSOR_SIZE,24";

    input = {
      kb_layout = "us";
      kb_options = "caps:ctrl";
      follow_mouse = 1;
      touchpad = {
        natural_scroll = "no";
      };
    };

    general = {
      gaps_in = 9;
      gaps_out = 15;
      border_size = 2;
      layout = "dwindle";
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
    };
    decoration = {
      rounding = 15;
      active_opacity = 0.95;
      inactive_opacity = 0.92;
      drop_shadow = false;
  
      blur = {
          enabled = true;
          size = 5;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
          brightness = 0.95;
      };
    };
    animations = {
      enabled = "yes";
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default, slidevert"
      ];
    };
    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
    };
    gestures = {
      workspace_swipe = true;
      workspace_swipe_fingers = 3;
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
    };

    windowrule = [
      "float, ^(rofi)"
      "animation popin, rofi"

      ## -- Window Opacity -- ##
      "opacity 0.5, ^(rofi)(.*)$"
      "opacity 0.9, obsidian"
      "opacity 0.8, discord"
      "opacity 0.8, spotify"
      "opacity 0.8, kitty"
    ];

    ## -- Wallpaper shortcuts -- ##
    "$w1" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/cat_wave.png";
    "$w2" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/peach_nix.png";
    "$w3" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/cat_fleet.png";
    "$w4" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/cat_galaxies.png";
    "$w5" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/cat_ferris.png";
    "$w6" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/cat_nix.png";
    "$w7" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/cat_qusar.png";
    "$w8" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/art_flowers.png";
    "$w9" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/cat_solar_system.png";

    ## -- Main Bind -- ##
    "$mod" = "SUPER";

    # --- The Binds --- #
    bind = [
      ## --- Main Binds --- ##
      "$mod, T, exec, kitty"
      "$mod, Q, killactive "
      "$mod, W, exit"
      "$mod, E, exec, kitty lf"
      "$mod, F, exec, brave"
      "$mod, V, togglefloating, q"
      "$mod, R, exec, rofi -show run"
      "$mod, P, pseudo, # dwindle"
      "$mod, O, togglesplit, # dwindle"
      "$mod, S, exec, slurp | grim -g - - | swappy -f -"
      "$mod, L, exec, bash ~/scripts/swaylock.sh"
      "$mod, J, exec, rofimoji"

      ## --- Wallpaper Changes --- ##
      "SUPER_CTRL, 1, exec, $w1"
      "SUPER_CTRL, 2, exec, $w2"
      "SUPER_CTRL, 3, exec, $w3"
      "SUPER_CTRL, 4, exec, $w4"
      "SUPER_CTRL, 5, exec, $w5"
      "SUPER_CTRL, 6, exec, $w6"
      "SUPER_CTRL, 7, exec, $w7"
      "SUPER_CTRL, 8, exec, $w8"
      "SUPER_CTRL, 9, exec, $w9"
    
      # Move focus with mainMod + arrow keys
      "$mod SHIFT, left, movefocus, l"
      "$mod SHIFT, right, movefocus, r"
      "$mod SHIFT, up, movefocus, u"
      "$mod SHIFT, down, movefocus, d"

      # Switch workspaces with mainMod + [0-9]
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"

      # Scroll through existing workspaces with mainMod + scroll
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
    ];
    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "alt, mouse:272, movewindow"
      "alt, mouse:273, resizewindow"
    ];
  };
 };
}
