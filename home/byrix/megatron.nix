{ pkgs, ... }: {
  imports = [
    ./global
    ./features/config/colours.nix
    ./features/desktop/niri
    ./features/games
    ./features/desktop/common
    ./features/productivity
  ];

  home.packages = [ pkgs.isoimagewriter ];
}
