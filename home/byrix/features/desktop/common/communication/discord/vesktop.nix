{
  programs.vesktop = {
    enable = true;
  };

  xdg.desktopEntries.vesktop = {
    name = "Vesktop";
    genericName = "Discord client";
    comment = "Discord client";
    icon = "discord";
    exec = "vesktop --ozone-platform=wayland";
  };
}
