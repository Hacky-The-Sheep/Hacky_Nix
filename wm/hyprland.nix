{
wayland.windowManager.hyprland = {
  enable = true;
  enableNvidiaPatches = true;

  exec-once = [
    "dunst"
    "waybar"
    "swww init"
    "exec-once = swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/arch.jpeg"
  ];

  # Set the default monitor
  monitor = "eDP-1, highrr, 0x0, 1";

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
    col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
    col.inactive_border = "rgba(595959aa)";
    layout = "dwindle";
  };
  decoration = {
    rounding = 15;
    active_opacity = 0.95;
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
  ];

  ## -- Wallpaper shortcuts -- ##
  "$w1" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/arch.jpeg";
  "$w2" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/Hardcoding.jpg";
  "$w3" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/pac.jpg";
  "$w4" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/Porsche.png";
  "$w5" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/Tri_Arch.jpg";
  "$w6" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/Hills.png";
  "$w7" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/Kaiju.png";
  "$w8" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/art_flowers.png";
  "$w9" = "swww img --transition-type wipe --transition-angle 30 --transition-step 90 ~/Pictures/Wallpapers/neon_zilla.jpg";

  ## -- Main Bind -- ##
  "$mainMod" = "SUPER";

  # --- The Binds --- #
  bind = [
    ## --- Main Binds --- ##
    "$mainMod, T, exec, kitty"
    "$mainMod, Q, killactive "
    "$mainMod, W, exit"
    "$mainMod, E, exec, kitty lf"
    "$mainMod, F, exec, firefox"
    "$mainMod, V, togglefloating, q"
    "$mainMod, R, exec, ~/.config/rofi/launchers/type-1/launcher.sh"
    "$mainMod, P, pseudo, # dwindle"
    "$mainMod, O, togglesplit, # dwindle"
    "$mainMod, S, exec, slurp | grim -g - - | wl-copy"
    "$mainMod, L, exec, bash ~/sway.sh"
    "$mainMod, M, exec, bash ~/.config/hypr/scripts/mullvad.sh"
    "$mainMod, J, exec, rofimoji"

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
    "$mainMod SHIFT, left, movefocus, l"
    "$mainMod SHIFT, right, movefocus, r"
    "$mainMod SHIFT, up, movefocus, u"
    "$mainMod SHIFT, down, movefocus, d"

    # Switch workspaces with mainMod + [0-9]
    "$mainMod, 1, workspace, 1"
    "$mainMod, 2, workspace, 2"
    "$mainMod, 3, workspace, 3"
    "$mainMod, 4, workspace, 4"
    "$mainMod, 5, workspace, 5"
    "$mainMod, 6, workspace, 6"
    "$mainMod, 7, workspace, 7"
    "$mainMod, 8, workspace, 8"
    "$mainMod, 9, workspace, 9"
    "$mainMod, 0, workspace, 10"

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    "$mainMod SHIFT, 1, movetoworkspace, 1"
    "$mainMod SHIFT, 2, movetoworkspace, 2"
    "$mainMod SHIFT, 3, movetoworkspace, 3"
    "$mainMod SHIFT, 4, movetoworkspace, 4"
    "$mainMod SHIFT, 5, movetoworkspace, 5"
    "$mainMod SHIFT, 6, movetoworkspace, 6"
    "$mainMod SHIFT, 7, movetoworkspace, 7"
    "$mainMod SHIFT, 8, movetoworkspace, 8"
    "$mainMod SHIFT, 9, movetoworkspace, 9"
    "$mainMod SHIFT, 0, movetoworkspace, 10"

    # Scroll through existing workspaces with mainMod + scroll
    "$mainMod, mouse_down, workspace, e+1"
    "$mainMod, mouse_up, workspace, e-1"
  ];
  bindm = [
    # Move/resize windows with mainMod + LMB/RMB and dragging
    "alt, mouse:272, movewindow"
    "alt, mouse:273, resizewindow"
  ];
 };
}
