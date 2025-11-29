{ ... }:
{
  imports = [
    ./treesitter.nix
  ];

  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;
      guess-indent.enable = true;
    };
  };
}
