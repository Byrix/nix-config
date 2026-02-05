# Basic plain-text files such as Markdown, JSON, TOML, etc
{
  lsp.servers = {
    marksman.enable = true;
    tombi.enable = true;
    jsonls.enable = true;
  };

  plugins.conform-nvim.settings.formatters_by_ft = {
    markdown = [ "mdformat" ];
    toml = [
      "tombi"
      "pyproject-fmt"
    ];
    json = [ "fixjson" ];
  };
}
