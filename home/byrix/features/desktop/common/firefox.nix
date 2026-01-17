{ config, ... }: {
  programs.firefox = {
    enable = true;
    profiles.byrix = {
      id = 0;
      isDefault = true;
      bookmarks = {};

      search = {
        default = "ddg";
        privateDefault = "ddg";
        force = true;
        engines = {
          nixos-wiki = {
            name = "NixOS Wiki";
            urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
            iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
            definedAliases = [ "@nw" ];
          };
          bing.metaData.hidden = true;
          google.metaData.hidden = true;
        };
      };

      # TODO: Extensions required 3rd party repo
      extensions = {
        force = true;
      };
    };
  };
}