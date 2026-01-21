{ inputs, pkgs, ... }: {
  imports = [
    inputs.niri.homeModules.niri
    ./keybinds.nix

    ../common/tofi.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      prefer-no-csd = true;
      hotkey-overlay.skip-at-startup = true;
      
    };
  };

  home.packages = with pkgs; [
    xwayland-satellite
  ];
}
