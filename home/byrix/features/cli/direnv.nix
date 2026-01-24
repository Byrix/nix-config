{ config, inputs, ... }: {
  imports = [ inputs.direnv-instant.homeModules.direnv-instant ];

  programs = {
    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;

      # Disable default integrations in favour
      # of direnv-instant instead
      # See: https://github.com/Mic92/direnv-instant#setup
      enableBashIntegration = false;
      enableFishIntegration = false;
      enableZshIntegration = false;
      enableNushellIntegration = false;
    };

    direnv-instant = {
      enable = true;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableZshIntegration = config.programs.zsh.enable;
    };
  };
}