{ config, lib, ... }:
{
  services.hypridle = {
    enable = true;
    settings = let
      isLocked = "pgrep hyprlock";
      isDischarging = "grep Discharging /sys/class/power_supply/BAT{0,1}/status -q";
    in {
      general = {
        lock_cmd = "if ! ${isLocked}; then ${lib.getExe config.programs.hyprlock.package} --grace 5; fi";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 150;
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 300;
          on-timeout = loginctl lock-session;
        }
        {
          timeout = 330;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
        }
      ];
    };
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [ "hypridle" ];
  };
}
