{ pkgs, ... }: {
  imports = [
    ./lutris.nix
    ./steam.nix
    ./prism-launcher.nix
  ];

  home.packages = [ pkgs.gamescope ];
}
