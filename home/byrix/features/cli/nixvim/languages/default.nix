{
  imports = [
    ./nix.nix
  ];

  plugins.conform-nvim.formatters_by_ft = {
    "*" = [ "codespell" ];
    "_" = [ "trim_whitespace" ];
  };
}
