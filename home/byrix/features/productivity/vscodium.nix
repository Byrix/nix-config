{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    # profiles.default = {
    #   enableUpdateCheck = false;
    #   extensions = with pkgs.vscode-extensions; [
    #     catppuccin.catppuccin-vsc
    #     catppuccin.catppuccin-vsc-icons
    #     jnoortheen.nix-ide
    #   ];
    #   userSettings = {
    #     "workbench.colorTheme" = "Catppuccin Macchiato";
    #     "workbench.iconTheme" = "catppuccin-macchiato";
    #     "catppuccin.accentColor" = "green";
    #     "catppuccin-icons.hidesExplorerArrows" = true;
    #   };
    # };
  };
}
