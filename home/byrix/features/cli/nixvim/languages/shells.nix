{
  lsp.servers = {
    bashls.enable = true;
    fish_lsp.enable = true;
    systemd_lsp.enable = true;
  };

  plugins.conform-nvim.settings.formatters_by_ft = {
    bash = [
      "shfmt"
      "shellharden"
      "beautysh"
    ];
  };
}
