{ config, lib, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      "$font" = "NotoSans Nerd Font";

      general.hide_cursor = true;

      animations = {
        enabled = true;
        bezier = "linear, 1, 1, 0, 0";
        animation = [
          "fadeIn, 1, 5, linear"
          "fadeOut, 1, 5, linear"
          "inputFieldDots, 1, 2, linear"
        ];
      };

      background = {
        path = "screenshot";
        blur_passes = 4;
      };

      # === WIDGETS ===================
      # --- Password --------
      input-field = {
        monitor = "${(lib.filter (m: m.primary) config.monitors).name}";
        size = "20%, 5%";
        position = "0, -20";
        outline_thickness = 2;
        rounding = 15;
        font_family = "$font";
        fade_on_empty = false;
        hide_input = true;
        # hide_input_base_color = $mauve;

        # inner_color = "$mantle";
        # outer_color = "$blue";
        # check_color = "$yellow";
        # fail_color = "$red";
        # font_color = "$text";

        placeholder_text = "<i>Welcome back, $USER</i>";
        fail_text = "<i>$FAIL <b>(##$ATTEMPTS)</b></i>";
      };

      label = [
        {
          monitor = "${(lib.filter (m: m.primary) config.monitors).name}";
          text = "$TIME";
          font_size = 90;
          font_family = "$font";
          # color = "$text";
          position = "0, -100";
          valign = "top";
        }
        {
          monitor = "${(lib.filter (m: m.primary) config.monitors).name}";
          text = "cmd[update:1800000] date +\"%A, %d %B %Y\""; # 30 min
          font_size = 25;
          font_family = "$font";
          # color = "$text";
          position = "0, -250";
          valign = "top";
        }
      ];
    };
  };
}
