{ lib, config, ... }:
{
  programs.hyprshot.enable = true;

  wayland.windowManager.hyprland.settings = {
    bind = [ "$mainMod SHIFT, S, exec, hyprshot -m region --clipboard-only" ];
  };
}
