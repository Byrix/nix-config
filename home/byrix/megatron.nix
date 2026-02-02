{ pkgs, ... }:
{
  imports = [
    ./global
    ./features/desktop/niri
    ./features/games
    ./features/desktop/common
    ./features/productivity
  ];

  home.packages = [ pkgs.isoimagewriter ];

  #  ----------
  # | HDMI-A-1 |  --------------
  #  ----------  |     DP-1     |
  # |   DP-2   |  --------------
  #  ----------
  monitors = [
    {
      name = "DP-1";
      height = 1440;
      width = 3440;
      primary = true;
      position = {
        x = 0;
        y = 0;
      };
    }
    {
      name = "DP-2";
      height = 1080;
      width = 1920;
      position = {
        x = -1920;
        y = 720;
      };
    }
    {
      name = "HDMI-A-1";
      height = 1080;
      width = 1920;
      position = {
        x = -1920;
        y = -720;
      };
    }
  ];
}
