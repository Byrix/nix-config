{
  programs.zed-editor = {
    extensions = [ "nix" ];
    userSettings = {
      lsp = { nil = { settings.formatting.command = [ "nixfmt" ]; }; };
    };
  };
}
