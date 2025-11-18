{ lib, config, ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";

        width = 300;
        height = "(0, 300)";
        origin = "top-right";
        offset = "(10, 50)";

        indicate_hidden = "yes";

        transparency = 10;
        sort = true;
        font = "Monospace 8";
        markup = "full";
      };

      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        timeout = 10;
        default_icon = "dialog-information";
      };
      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        timeout = 10;
        override_pause_level = 30;
        default_icon = "dialog-information";
      };
      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#f38ba8";
        timeout = 0;
        override_pause_level = 60;
        default_icon = "dialog-warning";
      };
    };
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [ "dunst" ];
  };
}
