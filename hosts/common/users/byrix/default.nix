{ pkgs, config, lib, ... }: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = false;
  users.users.byrix = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$lG99VjY60ayaGUeFfNhTr0$h6qjqZp6fJhyU1X0/OdJXvAzWnbPt2PE5ZNbz/iYjt2";
    description = "Sean";
    extraGroups = ifTheyExist [ 
      "networkmanager" 
      "wheel"
      "allowssh" 
    ];
    packages = with pkgs; [
      kdePackages.kate
      home-manager
    ];
  };

  home-manager.users.byrix = import ../../../../home/byrix/${config.networking.hostName}.nix;
}
