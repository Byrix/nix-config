{
  imports = [
    ./text.nix
    ./nix.nix
    ./shells.nix
    ./git.nix
    ./iac.nix
    ./python.nix
    ./docker.nix
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
    codebook.enable = true;
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
