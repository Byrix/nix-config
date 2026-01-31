{
  plugins.telescope = {
    enable = true;

    extensions = {
      ui-select.enable = true;
      fzf-native = {
        enable = true;
        settings = {
          fuzzy = true;
          override_generic_sorter = true;
          override_file_sorter = true;
          case_mode = "smart_case";
        };
      };
      file_browser = {
        enable = true;
        settings = {
          hijack_netrw = true;
          grouped = true;
          hidden = true;
        };
        mappings.n =
          let
            act = a: "require('telescope._extensions.file_browser.actions').${a}";
          in
          {
            o = act "create";
            r = act "rename";
            y = act "copy";
            d = act "remove";
            m = act "move";
            l = act "open";
            h = act "goto_parent_dir";
            g = act "goto_home_dir";
          };
      };
      project = {
        enable = true;
        settings = {
          base_dirs = [ "~/dev" ];
          ignore_missing_dirs = true;
          on_project_selected.__raw = ''
            function(prompt_bufnr)
              require("telescope._extensions.project.actions").change_working_directory(prompt_bufnr, false)
              require("harpoon.ui").nav_file(1)
            end
          '';
          search_by = [
            "title"
            "path"
          ];
        };
      };
    };

    settings = {
      defaults = {
        buffer_previewer_maker.__raw = ''
          function(filepath, bufnr, opts)
            opts = opts or {}
            filepath = vim.fn.expand(filepath)
            vim.loop.fs_stat(filepath, function(_, stat)
              if not stat then
                return
              end
              if stat.size > 100000 then
                return
              else
                require("telescope.previewers").buffer_previewer_maker(filepath, bufnr, opts)
              end
            end)
          end
        '';
        file_ignore_patterns = [
          ".git/"
          "node_modules"
          "%_cache"
          "site_libs"
          ".direnv/"
          ".venv"
          "env"
        ];
        layout_strategy = "flex";
        layout_config.prompt_position = "top";
        mappings.i = {
          "<esc>" = "close";
          "<C-j>" = "move_selection_next";
          "<C-k>" = "move_selection_previous";
        };
      };
      pickers.find_files = {
        hidden = false;
        find_command = [
          "rg"
          "--files"
          "--hidden"
          "--glob"
          "!.git/**"
          "--glob"
          "!.direnv/**"
          "-L"
        ];
      };
    };
  };

  keymaps =
    let
      nmap = k: a: d: {
        action = a;
        key = k;
        mode = "n";
        options = {
          silent = true;
          noremap = true;
          desc = d;
        };
      };
    in
    [
      (nmap "<leader>f" "" "[f]ind (telescope)")
      (nmap "<leader>fc" "<cmd>Telescope git_commits<cr>" "git [c]omits")
      (nmap "<leader>ff" "<cmd>Telescope find_files<cr>" "[f]iles")
      (nmap "<leader>fk" "<cmd>Telescope keymaps<cr>" "[k]eymaps")
      (nmap "<leader>fb" "<cmd>Telescope file_browser<cr>" "file [b]rowser")
    ];
}
