{ pkgs, ... }: {
  imports = [
    ./global
    ./features/cli
    ./features/games
    ./features/apps
    ./features/productivity
  ];
}
