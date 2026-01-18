# NOTE: Requires enabling system level module too
# found in hosts/common/optional/desktops/hyprland.nix
{ config, ... }: {
  imports = [
    ./hyprland
    ./dunst.nix  # Notification daemon
    ./tofi.nix  # Application runner
  ];
}