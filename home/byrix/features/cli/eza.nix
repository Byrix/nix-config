{
  programs.eza = {
    enable = true;

    icons = "always";
    colors = "always";
    extraOptions = [
      "-loga"
      "--group-directories-first"
      "--no-time"
      "--no-permissions"
      "--smart-group"
    ];
  };
}
