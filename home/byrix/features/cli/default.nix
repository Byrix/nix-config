{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./ssh.nix
    ./gpg.nix
    ./fish.nix
    ./starship
    ./direnv.nix
    ./fzf.nix
    ./neovim.nix
  ];

  programs = {
    htop.enable = true;
  };

  home = {
    packages = with pkgs; [
      neofetch
    ];
    shellAliases = {
      "update" = "sudo nixos-rebuild switch --flake /home/$(whoami)/.nix-config/.#$(hostname)";
      "testnix" = "sudo nixos-rebuild test --flake /home/$(whoami)/.nix-config/.#$(hostname)";
      "where" = "which";
    };
  };
}
