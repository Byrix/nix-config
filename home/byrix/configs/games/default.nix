{ pkgs, ... }: {
  imports = [
    ./steam.nix
    ./prism-launcher.nix
  ];

  home.packages = [ pkgs.gamescope ];
}
