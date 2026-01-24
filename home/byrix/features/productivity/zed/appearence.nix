{
  programs.zed-editor.userSettings = {
    # === EDITOR ======================
    cursor_shape = "underline";

    # --- Behaviour ---------
    pane_split_direction_horizontal = "down";
    pane_split_direction_vertical = "right";
    soft_wrap = "preferred_line_length";

    # --- Inline ------------
    diagnostics.inline.enabled = true;
    git.inline_blame.enabled = false;
    indent_guides.coloring = "fixed";
    colorize_brackets = true;
    show_whitespaces = "selection";

    # --- Gutter + Scrollbar
    relative_line_numbers = true;
    git.hunk_style = "unstaged_hollow";
    scrollbar = {
      git_diff = false;
      show_diagnostics = "warning";
      axes.horizontal = false;
    };

    # === UI ==========================
    # --- Tabs --------------
    tab_bar = {
      show_nav_history_buttons = false;
      show_tab_bar_buttons = false;
    };
    tabs = {
      file_icons = true;
      git_status = true;
      show_diagnostics = "all";
    };

    # --- Toolbar -----------
    toolbar = {
      quick_actions = false;
      selections_menu = false;
      agent_review = false;
    };

    # --- Title Bar ---------
    title_bar = {
      show_branch_icon = true;
      show_onboarding_banner = false;
      show_user_picture = false;
      show_user_menu = false;
      show_sign_in = false;
    };

    # --- Panels ------------
    project_panel = {
      entry_spacing = "standard";
      indent_size = 10;
      indent_guides.show = "always";
      scrollbar.show = "never";
    };
    collaboration_panel.button = false;
    git_panel.sort_by_path = true;
    outline_panel.scrollbar.show = "never";
  };
}
