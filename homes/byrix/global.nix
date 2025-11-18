{ inputs, lib, pkgs, config, outputs, nix-colors, ... }:
{
  imports = [
    inputs.impermanence.homeManagerModules.impermanence 
    nix-colors.homeManagerModules.default
    ./apps/cli
  ]
  ++ (builtins.attrValues outputs.homeManagerModules);

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  systemd.user.startServices = "sd-switch";
  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home = {
    username = lib.mkDefault "byrix";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "22.05";
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      NH_FLAKE = "$HOME/Documents/NixConfig";
    };

    persistence = {
      "/persist".directories = [
        "Documents"
        "Downloads"
        "Pictures"
        "Videos"
        ".local/bin"
        ".local/share/nix" # Trusted settings + repl history
      ];
    };
  };

  # Styling
  colourScheme = nix-colors.colorSchemes.catppuccin-mocha;
  fontProfiles = {
    enable = true;
    monospace = {
      name = "NotoSansM Nerd Font";
      package = pkgs.nerd-fonts.noto;
      italic = "Condensed Regular";
    };
    regular = {
      name = "NotoSans Nerd Font";
      package = pkgs.nerd-fonts.noto;
      italic = "Condensed Regular";
    };
  };
}
