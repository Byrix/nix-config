{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      enableUpdateCheck = false;

      extensions = with pkgs.vscode-extensions; [
        gruntfuggly.todo-tree
        gitlab.gitlab-workflow
        mkhl.direnv
      ];
    };
  };
}
