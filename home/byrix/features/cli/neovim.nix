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
    ];
  }
}