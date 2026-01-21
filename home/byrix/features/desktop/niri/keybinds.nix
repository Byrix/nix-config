{ pkgs, config, ... }: {
  programs.niri.settings = {
    input.mod-key = "Super";

    binds = with config.lib.niri.actions; {
      "Mod+Q".action = close-window;
      "Mod+Space".action = toggle-window-floating;
      "Mod+F".action = fullscreen-window;

      "Mod+R".action = spawn "${pkgs.tofi}/bin/tofi-drun";
      "Mod+Return".action = spawn "${pkgs.ghostty}/bin/ghostty";
      "Mod+B".action = spawn "${pkgs.firefox}/bin/firefox";
    };
  };
} 