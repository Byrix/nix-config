{ lib, ... }:
{
  plugins.nvim-tree = {
    enable = true;
    settings = {
      disable_netrw = true;
      update_focused_file.enable = true;
      diagnostics.enable = true;
      git = {
        enable = true;
        ignore = false;
        timeout = 500;
      };
      renderer = {
        indent_width = 2;
        icons = {
          show.hidden = true;
          git_placement = "after";
          bookmarks_placement = "after";
        };
      };
      view = {
        width = lib.nixvim.mkRaw ''
          function()
                    return math.floor(vim.opt.columns:get() * 0.5)
                  end'';
        float = {
          enable = true;
          open_win_config = lib.nixvim.mkRaw ''
            function()
              local scr_w = vim.opt.columns:get()
              local scr_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local win_w = scr_w * 0.5
              local win_h = scr_h * 0.8
              local win_w_int = math.floor(win_w)
              local win_h_int = math.floor(win_h)
              local cen_x = (scr_w - win_w) / 2
              local cen_y = ((vim.opt.lines:get() - win_h) / 2) - vim.opt.cmdheight:get()
              return {
                border = "rounded",
                relative = "editor",
                row = cen_y,
                col = cen_x,
                width = win_w_int,
                height = win_h_int,
              }
            end
          '';
        };
      };
    };
  };

  keymaps = [
    {
      key = "<A-b>";
      action = "<cmd>NvimTreeToggle<cr>";
      mode = [
        "n"
        "i"
      ];
      options = {
        silent = true;
        noremap = true;
        desc = "Toggle file browser panel";
      };
    }
  ];

  autoGroups.NvimTreeResize.clear = true;
  autoCmd =
    let
      api = "require('nvim-tree.api')";
    in
    [
      {
        event = [
          "VimResized"
          "WinResized"
        ];
        group = "NvimTreeResize";
        callback = lib.nixvim.mkRaw ''
          function()
            local winid = ${api}.tree.winid()
            if (winid) then
              ${api}.tree.reload()
            end
          end
        '';
      }
    ];
}
