{
  lsp.servers = {
    basedpyright = {
      enable = true;
      config.root_markers = [
        ".venv"
        "venv"
      ];
    };
  };

  plugins.conform-nvim.settings = {
    formatters_by_ft.python = [
      "black"
    ];
  };
}
