{ pkgs, config, ... }:
{
  imports = [
    ./git.nix
    ./ssh.nix
    ./gpg.nix
    ./fish.nix
    ./starship
    ./direnv.nix
    ./fzf.nix
    ./neovim.nix
    ./eza.nix

    ./ranger.nix
  ];

  programs = {
    htop.enable = true;
    jq.enable = true;
    lazydocker = config.nixos.virtualisation.docker.enable;
  };

  home = {
    packages = with pkgs; [ neofetch ];
    shellAliases = {
      "ns" = "nh os switch";
      "nt" = "nh os test";
      "where" = "which";
      "lg" = "lazygit";
    };
  };
}
