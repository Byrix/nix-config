{
  programs.alacritty = {
    enable = true;
    settings = {
      window.dynamic_padding = true;
      env.TERM = "xterm-256color";
    };
  };
}
