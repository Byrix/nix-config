{ config, inputs, ... }: {
  imports = [ inputs.direnv-instant.homeModules.direnv-instant ];

  programs = {
    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };

    direnv-instant = {
      enable = config.programs.tmux.enable;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableZshIntegration = config.programs.zsh.enable;
    };
  };
}