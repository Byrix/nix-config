{ pkgs, config, lib, ... }: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = false;
  users.users.byrix = {
    isNormalUser = true;
    description = "Sean";
    hashedPasswordFile = config.sops.secrets.byrix-password.path;
    openssh.authorizedKeys.keys = lib.splitString "\n" (builtins.readFile ./ssh.pub);
    
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

  sops.secrets.byrix-password = {
    sopsFile = ../../secrets.yaml;
    neededForUsers = true;
  };

  home-manager.users.byrix = import ../../../../home/byrix/${config.networking.hostName}.nix;
}
