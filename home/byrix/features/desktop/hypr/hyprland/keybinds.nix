{ lib, ... }: {
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    bind = let 
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
    in [
      "$mainMod, Q, killactive"
      "$mainMod, SPACE, togglefloating"

      "$mainMod, F, fullscreen, 1"
      "$mainMod SHIFT, F, fullscreen, 0"

      "$mainMod SHIFT, M, exit,"
      "$mainMod SHIFT, R, forcerendererreload"

      "$mainMod, RETURN, exec, $terminal"
      "$mainMod, R, exec, $menu"
      "$mainMod, B, exec, $browser"
    ]
    ++ (map (n: "$mainMod, ${n}, workspace, ${n}") workspaces)
    ++ (map (n: "$mainMod SHIFT, ${n}, movetoworkspacesilent, ${n}") workspaces)
    ++ (lib.mapAttrsToList (key: direction: "$mainMod, ${key}, movefocus, ${direction}") directions)
    ++ (lib.mapAttrsToList (key: direction: "$mainMod CONTROL, ${key}, swapwindow, ${direction}") directions);

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    binde = let 
      directions = rec {
        left = "-10 0";
        right = "10 0";
        up = "0 -10";
        down = "0 10";
        h = left;
        l = right;
        k = up;
        j = down;
      };
    in []
    ++ (lib.mapAttrsToList (key: direction: "$mainMod SHIFT, ${key}, resizeactive, ${direction}") directions);

    bindl = [
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPause, exec, playerctl play-pause"
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioPrev, exec, playerctl previous"
      ",XF86MonBrightnessUp, exec, brightnessctl s +10%"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];
    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];
  };
}