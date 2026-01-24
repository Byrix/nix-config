{
  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;

    imports = [ ./appearence.nix ./lsp.nix ];

    userSettings = {
      tab_size = 2;
      hour_format = "hour24";
      disable_ai = true;
      direnv = "shell_hook";

      restore_on_startup = "last_workspace";
      search.center_on_match = true;
      center_on_match = true;

      git_hosting_providers = [{
        provider = "gitlab";
        name = "GitLab";
        base_url = "https://git.byrix.dev";
      }];

      telemetry = {
        diagnostics = false;
        metrics = false;
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
    };
  };
}
