{
  programs.starship.settings = {
    format = "$all$line_break$username$hostname $character";

    username = {
      format = "[$user]($style)";
      show_always = true;
    };
    hostname.format = "@[$hostname]($style)";
  };
}