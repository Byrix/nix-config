{
  imports = [
    ./cmp.nix
    ./conform.nix
    ./telescope.nix
    ./indent-blankline.nix
    ./treesitter.nix
    ./projections.nix
  ];

  plugins = {
    # Editor
    nvim-autopairs.enable = true;
    neogen.enable = true;
    none-ls.enable = true;
    otter.enable = true;
    lspconfig.enable = true;

    # Keybinds
    which-key.enable = true;
    comment.enable = true;

    # Git
    diffview.enable = true;
    gitsigns.enable = true;
    git-conflict.enable = true;
    gitblame.enable = true;
    lazygit.enable = true;

    # Visuals & UI
    lualine.enable = true;
    dropbar.enable = true;
    colorizer.enable = true;
    web-devicons.enable = true;
    render-markdown.enable = true;
    todo-comments = {
      enable = true;
      settings.signs = true;
    };
    toggleterm = {
      enable = true;
      settings = {
        direction = "float";
        open_mapping = "[[<C-\\>]]";
      };
    };
  };

  keymaps =
    let
      nmap = k: a: d: {
        key = k;
        action = a;
        mode = "n";
        options = {
          silent = true;
          noremap = true;
          desc = d;
        };
      };
    in
    [
      # Git maps
      (nmap "<leader>g" "" "[g]it")
      (nmap "<leader>gg" "<cmd>LazyGit<cr>" "lazy[g]it")
      (nmap "<leader>gd" "" "[d]iff")
      (nmap "<leader>gdo" "<cmd>DiffviewOpen<cr>" "[o]pen")
      (nmap "<leader>gdc" "<cmd>DiffviewClose<cr>" "[c]lose")
      (nmap "<leader>gb" "<cmd>GitBlameToggle<cr>" "[b]lame")
    ];
}
