{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      input.kb_layout = "us";
      input.follow_mouse = 1;

      dwindle.pseudotile = true;
      dwindle.preserve_split = true;

      misc.force_default_wallpaper = 0;
      misc.disable_hyprland_logo = true;

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };

  imports = [
    ./decoration.nix
    ./keybinds.nix
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
}