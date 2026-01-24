{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
      options = "-K 7d";
    };
  };
}