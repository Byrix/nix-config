{ pkgs, ... }:
{
  imports = [
    ./global.nix
  ];

  # wallpaper = pkgs.inputs.themes.wallpapers.howl;

  # ----------
  # |  DP-2  | --------------
  # ---------- |    DP-1    |
  # ---------- --------------
  # | HDMI-1 |
  # ----------
  monitors = [
    {
      name = "DP-1";
      width = 3440;
      height = 1440;
      workspace = "1";
      workspaceName = "home";
      primary = true;
    }
    {
      name = "DP-2";
      workspace = "3";
      workspaceName = "media";
      position = "-1920x900";
    }
    {
      name = "HDMI-1";
      workspace = "2";
      workspaceName = "misc";
      position = "-1920x-210";
    }
  ];
}
