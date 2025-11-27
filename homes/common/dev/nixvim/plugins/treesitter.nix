{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammers; [
      # Linux 
      bash
      ssh_config
      tmux

      # Nix
      nix
      query
      vim
      vimdoc
      lua
      luadoc

      # General
      csv
      diff
      editorconfig
      git_config
      git_rebase
      gitattributes
      gitcommit
      gitignore
      ini
      markdown
      markdown_inline
      regex
      xml
      yaml
      dot

      # Web dev
      html
      css
      javascript
      json
      sql
      scss
      tsx
      typescript

      # Quarto
      latex
      mermaid

      # Other
      python
      r
    ];

    settings = {
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = false;
      };

      indent.enable = true;

      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "gnn";
          node_incremental = "grn";
          scope_incremental = "grc";
          node_decremental = "grm";
        };
      };

      textobjects = {
        select = {
          enable = true;
          lookahead = true;
          keymaps = {
            af = "@function.outer";
            "if" = "@function.inner";
            ac = "@class.outer";
            ic = "@class.inner";
          };
        };
        move = {
          enable = true;
          set_jumps = true;
          goto_next_start = {
            "]m" = "@function.outer";
            "]]" = "@class.inner";
          };
          goto_next_end = {
            "]M" = "@function.outer";
            "]]" = "@class.outer";
          };
          goto_previous_start = {
            "[m" = "@function.outer";
            "[[" = "@class.inner";
          };
          goto_previous_end = {
            "[M" = "@function.outer";
            "[]" = "@class.outer";
          };
        };
      };
    };
  };
}
