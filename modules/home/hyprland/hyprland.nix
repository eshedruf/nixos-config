{ pkgs, ... }:

{
  # Enable the Home-Manager hyprland module
  wayland.windowManager.hyprland = {
    enable = true;

    # If you use the system NixOS hyprland package (recommended to avoid mismatched versions),
    # keep these as null. Otherwise set them to the hyprland packages you want.
    package = null;
    portalPackage = null;

    # Some user services need full session environment in systemd services:
    systemd.variables = [ "--all" ];

    # Hyprland settings (these will be rendered to ~/.config/hypr/hyprland.conf)
    settings = {

      # Monitors (single-line as in your original conf)
      monitor = "HDMI-A-1,3840x2160@60,0x0,1";

      # Keywords / shortcuts (your defined programs)
      "$terminal"    = "kitty";
      "$fileManager" = "dolphin";
      "$menu"        = "rofi -show drun";

      # Autostart
      "exec-once" = [
        "waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css &"
      ];

      # Environment variables (rendered as `env = X,Y`)
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      # General visuals & behavior
      general = {
        gaps_in      = 5;
        gaps_out     = 20;
        border_size  = 2;
        "col.active_border"   = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = "false";
        allow_tearing   = "false";
        layout = "dwindle";
      };

      # Decoration (rounded corners, opacity, shadow/blur blocks)
      decoration = {
        rounding = 10;
        active_opacity   = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = "false";
          # range = 4;
          # render_power = 3;
          # color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = "false";
          # size = 3;
          # passes = 1;
          # vibrancy = 0.1696;
        };
      };

      # Animations: bezier and animation entries preserved as strings
      animations = {
        enabled = "yes";

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      # Dwindle/master layouts
      dwindle = {
        pseudotile = "true";
        preserve_split = "true";
      };

      master = {
        new_status = "master";
      };

      misc = {
        vfr = "true";
        force_default_wallpaper = 1;
        disable_hyprland_logo = "false";
      };

      # Input (keyboard, touchpad)
      input = {
        kb_layout = "us,il";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = "true";
        };
      };

      gestures = {
        workspace_swipe = "false";
      };

      # Device block example (if you want device-specific settings; Hyprland supports repeated 'device' blocks)
      # Note: Home-Manager module renders device blocks when you define them as nested sets.
      device = [
        {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        }
      ];

      # Keybindings — keep as strings in a list (these mirror your hyprland.conf binds)
      bind = [
        "SUPER, Q, exec, $terminal"
        "SUPER, C, killactive,"
        "SUPER, M, exit,"
        "SUPER, E, exec, $fileManager"
        "SUPER, V, togglefloating,"
        "SUPER, R, exec, $menu"
        "SUPER, P, pseudo,"
        "SUPER, J, togglesplit,"
        "SUPER, B, exec, pkill waybar ; waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css"
        "SUPER, L, exec, hyprlock"

        # Move focus with mainMod + arrow keys
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"

        # Workspaces
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        # Move active window to a workspace
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"

        # Scratchpad example
        "SUPER, S, togglespecialworkspace, magic"
        "SUPER SHIFT, S, movetoworkspace, special:magic"

        # Scroll through workspaces with scroll
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
      ];

      # bindm / bindl / bindel style entries — Home-Manager supports them as lists too
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # Window rules and fixes copied from your conf
      "windowrulev2" = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      # If you need more raw lines preserved exactly, use `extra` list:
      # extra = [ "rawline1" "rawline2" ];
    };
  };
}

