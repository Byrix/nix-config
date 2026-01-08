{ pkgs, ... }: {
  programs.lutris = {
    enable = true;
    steamPackage = (pkgs.steam.override { extraPkgs = p: [p.gamescope]; });
  };
}
