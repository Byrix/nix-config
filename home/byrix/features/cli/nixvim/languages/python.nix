{
  lsp.servers = {
    basedpyright = {
      enable = true;
      config.root_markers = [
        "pyproject.toml"
        ".venv"
        "venv"
        "requirements.txt"
      ];
    };
  };

  plugins.conform-nvim.settings = {
    formatters_by_ft.python = [
      "black"
    ];
  };
}
