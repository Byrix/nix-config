{
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      mapping = {
        "<Tab>" = ''
          cmp.mapping(function(fallback)
            if cmp.visible() then
              local entry = cmp.get_selected_entry()
              if not entry then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              end
              cmp.confirm()
            else
              fallback()
            end
          end, {"i","s"})'';
      };
      sources = [
        # Filesystem paths
        { name = "path"; }
        # LSP & Treesitter
        { name = "nvim_lsp"; }
        { name = "nvim_lsp_signature_help"; }
        {
          name = "treesitter";
          keyword_length = 5;
          max_item_count = 3;
        }
        # Snippets
        {
          name = "luasnip";
          keyword_length = 3;
          max_item_count = 3;
        }
        # Buffer
        {
          name = "buffer";
          keyword_length = 5;
          max_item_count = 3;
        }
        # Academic Writing
        { name = "pandoc_references"; }
        # Misc
        { name = "calc"; }
        { name = "spell"; }
      ];

      completion.completeopt = "menu,menuone,noinsert";
    };
  };
}
