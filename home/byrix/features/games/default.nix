{ pkgs, ... }: {
  imports = [
    ./lutris.nix
    ./mangohud.nix
    ./steam.nix
    ./prism-launcher.nix
  ];

  home.packages = [ pkgs.gamescope ];
}
