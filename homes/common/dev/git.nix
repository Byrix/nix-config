{ lib, config, ... }:
{
  programs.git = {
    enable = true;
    userName = "byrix";
    userEmail = "git@byrix.dev";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
