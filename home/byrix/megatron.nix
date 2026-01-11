{
  imports = [
    ./global
    ./features/config/colours.nix
    ./features/games
    ./features/desktop/common
    ./features/productivity
  ];

  home.packages = [ pkgs.isoimagewriter ];
}
