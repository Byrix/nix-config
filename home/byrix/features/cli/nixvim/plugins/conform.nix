{
  plugins.conform-nvim = {
    enable = true;
    autoInstall.enable = true;
    settings = {
      format_on_save = {
        timeout_ms = 500;
        lsp_fallback = true;
      };

      formatters_by_ft = {
        # All files
        "*" = [ "codespell" ];
        # Unconfigured file types
        "_" = [ "trim_whitespace" ];

        nix = [
          "nil"
          "nixfmt"
        ];
      };
    };
  };
}
