{ pkgs, config, ... }:
{
  programs.niri.settings = {
    input.mod-key = "Super";

    binds =
      with config.lib.niri.actions;
      let
        set-volume = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@";
        playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
      in
      {
        "Mod+Q".action = close-window;
        "Mod+Space".action = toggle-window-floating;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;

        "Mod+R".action = spawn "${pkgs.tofi}/bin/tofi-drun";
        "Mod+Return".action = spawn "${pkgs.ghostty}/bin/ghostty";
        "Mod+B".action = spawn "${pkgs.firefox}/bin/firefox";
        "Mod+Escape".action = spawn "${pkgs.wleave}/bin/wleave";

        "Mod+H".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        "Mod+J".action = focus-window-or-workspace-down;
        "Mod+K".action = focus-window-or-workspace-up;

        "Mod+Ctrl+H".action = move-column-left;
        "Mod+Ctrl+L".action = move-column-right;
        "Mod+Ctrl+J".action = move-column-to-workspace-down;
        "Mod+Ctrl+K".action = move-column-to-workspace-up;

        "Mod+C".action = switch-preset-column-width;
        "Mod+Shift+L".action = set-column-width "+10%";
        "Mod+Shift+H".action = set-column-width "-10%";
        "Mod+Shift+J".action = set-window-height "-10%";
        "Mod+Shift+K".action = set-window-height "+10%";

        "XF86AudioPlay".action = playerctl "play-pause";
        "XF86AudioStop".action = playerctl "pause";
        "XF86AudioPrev".action = playerctl "previous";
        "XF86AudioNext".action = playerctl "next";
        "XF86AudioRaiseVolume".action = set-volume "5%+";
        "XF86AudioLowerVolume".action = set-volume "5%-";
      };
  };
}
