{ pkgs, ... }: {
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
      '';

      plugins = with pkgs.fishPlugins; [
        { name = "grc"; src = grc.src; }
        { name = "z"; src = z.src; }
        { name = "sponge"; src = sponge.src; }
        { name = "puffer"; src = puffer.src; }
        # { name = "plugin-git"; src = plugin-git.src; }
        { name = "fzf-fish"; src = fzf-fish.src; }
        { name = "forgit"; src = forgit.src; }
        { name = "fish-you-should-use"; src = fish-you-should-use.src; }
        { name = "colored-man-pages"; src = colored-man-pages.src; }
      ];
    };

    bash = {
      enable = true;
      initExtra = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
  };

  home.packages = with pkgs; [ grc ];
}