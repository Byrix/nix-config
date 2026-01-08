{ pkgs, ... }: {
  imports = [
    ./global
    ./features/config/colours.nix
    ./features/cli
    ./features/games
    ./features/apps
    ./features/productivity
  ];
}
