{ inputs, ... }:
{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    imports = [ ./keybinds.nix ];

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "macchiato";
        transparent_background = true;
      };
    };

    dependencies = {
      fzf.enable = true;
      tree-sitter.enable = true;
    };

    opts = {
      termguicolors = true;

      # Indentation
      autoindent = true;
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
      smartindent = true;
      breakindent = true;

      # Line numbering
      number = true;
      relativenumber = true;
      signcolumn = "yes:1";

      # Splits
      splitright = true;
      splitbelow = true;

      # Scroll
      scrolloff = 5;
    };

    autoCmd = [
      {
        command = "checktime";
        event = [
          "BufEnter"
          "FocusGained"
        ];
      }
      {
        event = [ "TermOpen" ];
        pattern = [ "*" ];
        callback = {
          __raw = ''
            function(_)
                        vim.cmd.setlocal 'nonumber'
                        vim.wo.signcolumn = 'no'
                        local opts = { buffer = 0 }
                        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
                        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
                        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
                        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
                        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
                      end'';
        };
      }
      {
        event = "TextYankPost";
        desc = "Highlight when yanking text";
        group = "highlight-yank";
        callback = {
          __raw = ''function() vim.highlight.on_yank() end'';
        };
      }
    ];
    autoGroups = {
      highlight-yank = {
        clear = true;
      };
    };
  };

  home.sessionVariables.EDITOR = "nvim";
}
