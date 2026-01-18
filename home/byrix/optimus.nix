{
  imports = [
    ./global
    ./features/desktop/hypr
    ./features/config/colours.nix
    ./features/desktop/common
    ./features/productivity
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [ "eDP-1,preferred,0x0,1" ];
    workspace = [
      "1, defaultName:home, monitor:eDP-1, default:true, persistent:true"
      "r[9], defaultName:media, monitor:eDP-1"
    ];
    windowrule = [
      "match:workspace name:media silent, class:(Spotify)"
      "match:workspace name:media silent, class:discord"
    ];
  };
}
