{
  programs.zed-editor = {
    extensions = [
      "nix"
      "markdownlint"
      "git-firefly"
      "zed-color-highlight"
      "gitlab-ci-ls"
    ];
    userSettings = {
      lsp = { nil = { settings.formatting.command = [ "nixfmt" ]; }; };
    };
  };
}
