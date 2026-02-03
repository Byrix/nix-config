{
  diagnostic.settings = {
    virtual_text = true;
    underline = true;
    signs = true;
  };

  lsp = {
    inlayHints.enable = true;
  };

  plugins = {
    lspconfig.enable = true;
    lsp-lines.enable = true;
  };

  autoGroups.lsp-attach.clean = true;
  autoCmd = [
    {
      event = [ "LspAttach" ];
      group = "lsp-attach";
      callback.__raw = ''
        function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          assert(client, "LSP client not found")
        end
      '';
    }
  ];
}
