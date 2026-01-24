{ pkgs, ... }: { 
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimDiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
      nvim-treesitter-context
      direnv-vim

      # Treesitter Parsers
      nvim-treesitter-parsers.bash
      nvim-treesitter-parsers.zsh
      nvim-treesitter-parsers.fish
      nvim-treesitter-parsers.toml
      nvim-treesitter-parsers.json
      nvim-treesitter-parsers.yaml
      nvim-treesitter-parsers.csv
      nvim-treesitter-parsers.markdown
      nvim-treesitter-parsers.markdown-inline
      nvim-treesitter-parsers.regex
      nvim-treesitter-parsers.gitignore
      nvim-treesitter-parsers.gitcommit
    ];
  }; 
}