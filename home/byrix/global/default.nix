{ inputs, lib, pkgs, config, outputs, nix-colours, ... }: {
  imports = [
    # nix-colours.homeManagerModules.default
  ];
  #++ (builtins.attrValues outputs.homeManagerModules);

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;

  home = {
    username = lib.mkDefault "byrix";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "25.05";
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      NH_FLAKE = "$HOME/.dotfiles";
    };
  };

  # colourScheme = nix-colours.colorSchemes.catppuccin-mocha;
}
