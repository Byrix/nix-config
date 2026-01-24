{ config, ... }: {
  programs.ghostty = {
    enable = true;
    # systemd = true;

    settings = with config.fontProfiles; {
      font-family = monospace.name;
      font-style = "Regular";
      font-style-bold = "Bold";
      font-synthetic-style = "no-bold";
      font-size = monospace.size;

      background-opacity = 0.6;
      background-blur = true;
    };
  };
}
