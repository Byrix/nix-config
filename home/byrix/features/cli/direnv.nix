{ config, ... }: {
  programs.direnv = {
    enable = true;
    enableBashIntegration = config.programs.bash.enable;
    enableFishIntegration = config.programs.fish.enable;
    enableZshIntegration = config.programs.zsh.enable;
    enableNushellIntegration = config.programs.nushell.enable;

    nix-direnv.enable = true;
    config.global.load_dotenv = true;
  };
}