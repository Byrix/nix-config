{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };

  wayland.windowManager.hyprland.settings = { "$terminal" = "ghostty +new-window"; };
}
