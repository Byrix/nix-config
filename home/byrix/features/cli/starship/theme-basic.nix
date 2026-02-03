{
  programs.starship.settings = {
    format = "$all$line_break$username$hostname $character";

    username = {
      format = "[$user]($style)";
      show_always = true;
    };
    hostname.format = "@[$hostname]($style)";

    git_branch.symbol = " ";
    git_state = {
      rebase = "";
      merge = "";
    };
    git_status = {
      disabled = true;
      format = "[$all_status]($style)";
      conflicted = "";
      ahead = "󰜹";
      behind = "󰜰";
      diverged = "󰜹󰜰";
      untracked = "";
      stashed = "";
      modified = "";
      staged = "";
      renamed = "";
      deleted = "";
    };
  };
}
