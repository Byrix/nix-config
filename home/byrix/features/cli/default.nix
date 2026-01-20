{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./ssh.nix
    ./gpg.nix
    ./fish.nix
    ./starship
    ./direnv.nix
    ./fzf.nix
  ];

  programs = {
    htop.enable = true;
  };

  home.packages = with pkgs; [
    neofetch
  ];

  home.shellAliases = {
    "update" = "sudo nixos-rebuild switch --flake /home/$(whoami)/.nix-config/.#$(hostname)";
    "updatetest" = "sudo nixos-rebuild test --flake /home/$(whoami)/.nix-config/.#$(hostname)";
  };
}
