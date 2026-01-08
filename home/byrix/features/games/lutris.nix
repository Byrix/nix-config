{ config, ... }: {
  programs.lutris = {
    enable = true;
    steamPackage = config.programs.steam.package;
  };
}
