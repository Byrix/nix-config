{ config, libs, ... }:
let
  steamGame = "class:steam_app_[0-9]*";
  wineTray = "class:explorer.exe";
in {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "suppressevent maximize, class:.*"
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

      # Steam options 
      "immediate, ${steamGame}"

      # Wine
      "workspace special silent, ${wineTray}"
    ];

    layerrule = [
      "animation fade, selection"
      "blur, notifications"
      "ignorezero, notifications"
    ];
  };
}
