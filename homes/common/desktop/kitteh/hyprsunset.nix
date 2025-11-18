{ lib, config, ... }:
{
  services.hyprsunset = {
    enable = true;
    settings = {
      max-gamma = 150;
      profile = [
        {
          time = "7:00";
          identity = true;
        }
        {
          time = "19:00";
          temperature = 5500;
          gamma = 1;
        }
      ];
    };
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [ "hyprsunset" ];
  };
}
