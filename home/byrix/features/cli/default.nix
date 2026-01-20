{
  imports = [
    ./git.nix
    ./ssh.nix
    ./gpg.nix
    ./fish.nix
    ./starship
    ./direnv.nix
    ./fzf.nix
  ];

  home.shellAliases = {
    "update" = "sudo nixos-rebuild switch --flake /home/$(whoami)/.nix-config/.#$(hostname)";
    "updatetest" = "sudo nixos-rebuild test --flake /home/$(whoami)/.nix-config/.#$(hostname)";
  };
}
