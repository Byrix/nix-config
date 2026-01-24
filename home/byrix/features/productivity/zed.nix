{ ... }: {
  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;
    extensions = [ "nix" ];
    userSettings = {
      hour_format = "hour24";
      vim_mode = true;
      disable_ai = true;
      direnv = "shell_hook";

      cursor_shape = "underline";
      scrollbar = {
        git_diff = false;
        show_diagnostics = "warning";
        axes.horizontal = false;
      };

      tab_bar = {
        show_nav_history_buttons = false;
        show_tab_bar_buttons = false;
      };
      tabs = {
        file_icons = true;
        git_status = true;
        show_diagnostics = "all";
      };
      toolbar = {
        quick_actions = false;
        selections_menu = false;
        agent_review = false;
      };

      file_scan_exclusions = [
        "**/.git"
        "**/.svn"
        "**/.hg"
        "**/.jj"
        "**/CVS"
        "**/.DS_Store"
        "**/Thumbs.db"
        "**/.classpath"
        "**/.settings"
        "**/.direnv"
      ];

      diagnostics.inline = { enabled = true; };
      git = {
        inline_blame.enabled = false;
        hunk_style = "unstaged_hollow";
      };

      pane_split_direction_horizontal = "down";
      pane_split_direction_vertical = "right";

      relative_line_numbers = true;
      restore_on_startup = "last_workspace";
      search.center_on_match = true;
      center_on_match = true;
      show_call_status_icon = false;
      show_whitespaces = "selection";
      indent_guides.coloring = "fixed";

      soft_wrap = "preferred_line_length";
      tab_size = 2;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      title_bar = {
        show_branch_icon = true;
        show_onboarding_banner = false;
        show_user_picture = false;
        show_user_menu = false;
        show_sign_in = false;
      };

      project_panel = {
        entry_spacing = "standard";
        indent_size = 10;
        indent_guides.show = "always";
        scrollbar.show = "never";
      };
      collaboration_panel.button = false;
      git_panel.sort_by_path = true;

      git_hosting_providers = [{
        provider = "gitlab";
        name = "GitLab";
        base_url = "https://git.byrix.dev";
      }];

      outline_panel.scrollbar.show = "never";
      calls.mute_on_join = true;
      colorize_brackets = true;

      lsp = { nil = { settings.formatting.command = [ "nixfmt" ]; }; };
    };

    userKeymaps = { };
  };
}
