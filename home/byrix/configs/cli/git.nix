{ pkgs, lib, ... }: {
  programs.git = {
    enable = true;
    userName = "Byrix";
    userEmail = "git@byrix.dev";
    extraConfig ={
      init.defaultBranch = "main";
    };
  };
}
