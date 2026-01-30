{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  keymaps =
    let
      opts = {
        silent = true;
        noremap = true;
      };
      nmap = k: a: {
        key = "${k}";
        mode = "n";
        action = "${a}";
        options = opts;
      };
    in
    [
      # Split movement and sizing
      (nmap "<M-h>" "<C-W>h")
      (nmap "<M-j>" "<C-W>j")
      (nmap "<M-k>" "<C-W>k")
      (nmap "<M-l>" "<C-W>l")
      (nmap "<C-h>" "<cmd>horizontal resize -2<CR>")
      (nmap "<C-j>" "<cmd>vertical resize +2<CR>")
      (nmap "<C-k>" "<cmd>vertical resize -2<CR>")
      (nmap "<C-l>" "<cmd>horizontal resize +2<CR>")
    ];
}
