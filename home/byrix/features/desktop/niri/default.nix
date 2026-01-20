{ inputs, pkgs, ... }: {
  imports = [
    inputs.niri.homeModules.niri
    ./keybinds.nix

    ../common/tofi.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {};
  };
}