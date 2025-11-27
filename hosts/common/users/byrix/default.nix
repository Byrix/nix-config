{ pkgs, config, lib, ... }:
let
  ifTheyExist = groups: builtins.filter ( group: builtins.hasAttr group config.users.groups ) groups;
in {
  users = {
    mutableUsers = false;
    users.byrix = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = ifTheyExist [ ];

      # openssh.authorizedKeys.keys = lib.splitString "\n" (builtins.readFile ../../../../homes/byrix/ssh.pub);
      # hashedPasswordFile = config.sops.secrets.byrix-password.path;
      packages = [pkgs.home-manager];
    };
  };

  # sops.secrets.byrix-password = {
  #   sopsFile = "../../secrets.yaml";
  #   neededForUsers = true;
  # };

  home-manager.users.byrix = import ../../../../homes/byrix/${config.networking.hostName}.nix;
  security.pam.services = {
    swaylock = {};
    hyprlock = {};
  };
}
