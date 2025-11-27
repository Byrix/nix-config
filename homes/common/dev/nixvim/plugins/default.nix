{ ... }:
{
  imports = [];

  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;
      guess-indent.enable = true;
    };
  };
}
