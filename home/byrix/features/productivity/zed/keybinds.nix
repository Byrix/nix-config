{
  programs.zed-editor = {
    userSettings = {
      base_keymap = "VSCode";
      vim_mode = true;
    };

    userKeymaps = [
      {
        context =
          "GitPanel || ProjectPanel || CollabPanel || OutlinePanel || ChatPanel || VimControl || EmptyPane || SharedScreen || MarkdownPreview || KeyContextView || DebugPanel";
        bindings = {
          "alt-l" = "workspace::ActivatePaneRight";
          "alt-h" = "workspace::ActivatePaneLeft";
          "alt-j" = "workspace::ActivatePaneDown";
          "alt-k" = "workspace::ActivatePaneUp";
        };
      }
      {
        context = "VimControl && !menu";
        bindings = {
          "space g a" = "workspace::ToggleRightDock";
          "space g c" = "git::Commit";
          "space g b" = "branches::OpenRecent";

          "space f f" = "pane::DeploySearch";

          "ctrl-\\" = "terminal_panel::ToggleFocus";

          "alt-\\" = "pane::SplitRight";
          "alt--" = "pane::SplitDown";
          "alt-q" = [ "pane::CloseActiveItem" { close_pinned = false; } ];
        };
      }
      {
        context = "GitPanel && not_editing";
        bindings = { "space g" = "workspace::ToggleRightDock"; };
      }
      {
        context = "Terminal";
        bindings = { "ctrl-\\" = "workspace::ToggleBottomDock"; };
      }
      {
        context = "Editor";
        bindings = { "ctrl-b" = "workspace::ToggleLeftDock"; };
      }
    ];
  };
}
