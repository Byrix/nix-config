{
  plugins.project-nvim = {
    enable = true;
    enableTelescope = true;
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
      (nmap "<leader>fp" "<cmd>Telescope projects<cr>" "[p]rojects")
      (nmap "<leader>p" "" "[p]rojects")
    ];
}
