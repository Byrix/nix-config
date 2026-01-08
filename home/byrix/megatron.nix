{ pkgs, ... }: {
  imports = [
    ./global
    ./features/config/colours.nix
    ./features/cli
    ./features/games
    ./features/desktop/common
    ./features/productivity
  ];
}
