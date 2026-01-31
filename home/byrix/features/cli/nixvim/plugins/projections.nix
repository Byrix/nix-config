{
  plugins.projections = {
    enable = true;
    settings = {
      workspaces = [
        "~/dev"
        "~/Documents/dev"
      ];
    };
  };

  keymaps =
    let
      workspace = "require('projections.workspace')";
      session = "require('projections.session')";
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
      (nmap "<leader>fp" "<cmd>Telescope projections<cr>" "[p]rojects")
      (nmap "<leader>p" "" "[p]rojects")
      (nmap "<leader>ps" "<cmd>lua ${session}.store(vim.loop.cwd())" "[s]ave session")
      (nmap "<leader>pr" "<cmd>lua ${session}.restore(vim.loop.cwd())" "[r]estore session")
      (nmap "<leader>pa" "<cmd>lua ${workspace}.add(vim.loop.cwd())" "[a]dd workspace")
      (nmap "<leader>pf" "<cmd>Telescope projections<cr>" "[f]ind project")
    ];

  autoCmd = [
    {
      # Autosave session on VimExit
      event = "VimLeavePre";
      callback.__raw = ''
        function()
          local cwd = vim.loop.cwd()
          if cwd ~= nil then
            require("projections.session").store(cwd)
          end
        end
      '';
    }
    {
      # Switch to project if vim was started in a project dir
      event = "VimEnter";
      callback.__raw = ''
        function()
          if vim.fn.argc() == 0 then
            local cwd = vim.loop.cwd()
            if cwd ~= nil then
              require("projections.switcher").switch(cwd)
            end
          end
        end
      '';
    }
  ];
}
