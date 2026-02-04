{
  plugins.conform-nvim = {
    enable = true;
    autoInstall.enable = true;
    settings = {
      format_on_save = {
        timeout_ms = 500;
        lsp_fallback = true;
      };
    };
  };
}
