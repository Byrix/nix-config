{ pkgs, lib, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      enableUpdateCheck = false;
      userSettings = import ./user-settings.nix;

      extensions = with pkgs.vscode-extensions; [
        mkhl.direnv
        vscodevim.vim
        mikestead.dotenv
        usernamehw.errorlens
        gruntfuggly.todo-tree
        gitlab.gitlab-workflow
        naumovs.color-highlight
        aaron-bond.better-comments
        alefragnani.project-manager
        christian-kohler.path-intellisense
      ];
    };
  };
}
