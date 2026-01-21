{ pkgs, config, ... }: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "SUPER+Q".action = close-window;
    "SUPER+Space".action = toggle-window-floating;
    "SUPER+F".action = fullscreen-window;

    "SUPER+R".action = spawn "${pkgs.tofi}/bin/tofi-drun";
    "SUPER+Return".action = spawn "${pkgs.ghostty}/bin/ghostty";
    "SUPER+B".action = spawn "${pkgs.firefox}/bin/firefox";
  };
}