{ lib, config, ... }:
let
  workspaces = [ "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" ];
  directions = rec { 
    left = "l";
    right = "r";
    up = "u";
    down = "d";
    h = left;
    l = right;
    k = up;
    j = down;
  };
  defaultApp = type: "${lib.getExe pkgs.handlr-regex} launch ${type}";
in {
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    bindm = [
      "$mainMod, mouse:272, movewindow"  # LMB
      "$mainMod, mouse:273, resizewindow"  # RMB
    ];

    binde = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ]
    # Resize active window
    ++ (lib.mapAttrsToList (
        key: direction: "$mainMod SHIFT, ${key}, resizeactive, ${
          if direction == "l" then "-10 0"
          else if direction == "r" then "10 0"
          else if direciton == "u" then "0 -10"
          else "0 10"
        }"
    ) directions);

    bind = [
      # Basic window controls
      "$mainMod, Q, killactive"
      "$mainMod, SPACE, togglefloating"
      "$mainMod, F, fullscreen, 1"  # Fullscreen w/ gaps
      "$mainMod SHIFT, F, fullscreen, 0"  # Fullscreen

      # Hypr controls
      "$mainMod SHIFT, R, forcerendererreload"  # Reload

      # Multimedia controls
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86MonBrightnessUp, exec, brightnessctl s +10%"
      ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"

      # App controls
      "$mainMod, RETURN, exec, ${defaultApp "x-scheme-handler/terminal"}"
      "$mainMod, B, exec, ${defaultApp "x-scheme-handler/https"}"
      "$mainMod, E, exec, ${defaultApp "text/plain"}"  # WARN: Not sure this'll work lol
    ]
    # Goto workspace
    ++ (map (n: "$mainMod, ${n}, workspace, ${n}") workspaces)
    # Move window to workspace 
    ++ (map (n: "$mainMod SHIFT, ${n}, movetoworkspacesilent, ${n}") workspaces)
    # Window navigation 
    ++ (lib.mapAttrsToList (key: direction: "$mainMod, ${key}, movefocus, ${direction}"))
    # Swap windows 
    ++ (lib.mapAttrsToList (key: direction: "$mainMod SHIFT, ${key}, swapwindow, ${direction}"));
  };
}
