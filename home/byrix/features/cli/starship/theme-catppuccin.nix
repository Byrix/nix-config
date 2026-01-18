{
  programs.starship.settings = {
    format = ''
      [](red)\
      $os\
      $username\
      [](bg:peach fg:red)\
      $directory\
      [](bg:yellow fg:peach)\
      $git_branch\
      $git_status\
      [](fg:yellow bg:green)\
      $c\
      $rust\
      $golang\
      $nodejs\
      $php\
      $java\
      $kotlin\
      $haskell\
      $python\
      [](fg:green bg:sapphire)\
      $conda\
      [](fg:sapphire bg:lavender)\
      $time\
      [ ](fg:lavender)\
      $cmd_duration\
      $line_break\
      $character
    '';

    palette = "catppuccin_mocha";
  };
}