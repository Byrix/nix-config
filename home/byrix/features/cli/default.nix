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
    ./eza.nix
  ];

  programs = {
    htop.enable = true;
    jq.enable = true;
  };

  home = {
    packages = with pkgs; [ neofetch ];
    shellAliases = {
      "ns" = "nh os switch";
      "nt" = "nh os test";
      "where" = "which";
    };
  };
}
