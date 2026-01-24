{ pkgs, ... }: { 
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      direnv-vim

      # Treesitter
      (nvim-treesitter.withPlugins (p: [
        p.bash
        # p.zsh
        p.fish
        p.toml
        p.json
        p.yaml
        p.csv
        p.markdown
        p.markdown-inline
        p.regex
        p.gitignore
        p.gitcommit
      ]))
      nvim-treesitter-context
      nvim-treesitter-endwise
    ];
  }; 
}