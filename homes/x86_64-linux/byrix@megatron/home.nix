{ config, pkgs, ... }:

{
  imports = [
    ../../modules/programs/terminals/kitty.nix
  ];

  home.username = "byrix";
  home.homeDirectory = "/home/byrix";

  # Enable flakes 
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
