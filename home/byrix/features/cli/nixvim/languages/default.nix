{
  imports = [
    ./nix.nix
    ./python.nix
  ];

  lsp.servers = {
    "*" = {
      enable = true;
      config = {
        root_markers = [
          ".git"
          "flake.nix"
          ".envrc"
        ];
      };
    };
  };

  plugins.conform-nvim.settings = {
    formatters_by_ft = {
      "*" = [ "codespell" ];
      "_" = [
        "trim_whitespace"
        "trim_newlines"
        "squeeze_blanks"
      ];
    };
  };
}
