{
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Byrix";
          email = "git@byrix.dev";
        };
        init.defaultBranch = "main";
      };
      signing = {
        key = "EB5A864869169CB3F9C739543DBA0D0D21E1A9C8";
        format = "openpgp";
        signByDefault = true;
      };
      ignores = [
        "**/*.env"
        "!**/*.env.example"

        "**/node_modules"
        "**/venv"
        "**/*conda"
        "**/.direnv"
        "**/.zed"
        "**/.vscode"
      ];
    };
    lazygit.enable = true;
  };
}
