{
  programs.zed-editor = {
    userSettings = {
      base_keymap = "VSCode";
      vim_mode = true;
    };

    userKeybinds = [{
      context =
        "GitPanel || ProjectPanel || CollabPanel || OutlinePanel || ChatPanel || VimControl || EmptyPane || SharedScreen || MarkdownPreview || KeyContextView || DebugPanel";
      bindings = {
        "ctrl-l" = "workspace::ActivatePaneRight";
        "ctrl-h" = "workspace::ActivatePaneLeft";
        "ctrl-j" = "workspace::ActivatePaneDown";
        "ctrl-k" = "workspace::ActivatePaneUp";
      };
    }];
  };
}
