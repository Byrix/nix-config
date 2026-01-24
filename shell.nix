{ pkgs ? import <nixpkgs> {}, ... }: {
  default = pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes ca-derivations";
    nativeBuildInputs = with pkgs; [
      nix
      home-manager
      git

      gnupg
    ];

    packages = with pkgs; [
      nil
      nixfmt
      vscode-extensions.jnoortheen.nix-ide
      vimPlugins.nvim-treesitter-parsers.nix
    ];
  };
}
