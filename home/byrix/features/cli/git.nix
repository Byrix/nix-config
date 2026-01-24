{ pkgs, lib, ... }: {
  programs.git = {
    enable = true;
    userName = "Byrix";
    userEmail = "git@byrix.dev";
    signing = {
      key = "EB5A864869169CB3F9C739543DBA0D0D21E1A9C8";
      format = "openpgp";
      signByDefault = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
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
}
