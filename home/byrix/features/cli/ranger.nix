{
  programs.ranger = {
    enable = true;

    plugins = [
      {
        name = "ranger_devicons";
        src = builtins.fetchGit {
          url = "https://github.com/alexanderjeurissen/ranger_devicons.git";
          rev = "1bcaff0366a9d345313dc5af14002cfdcddabb82";
        };
      }
    ];
    extraConfig = "default_linemode devicons";
  };
}
