{ pkgs, config, lib, ... }: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = false;
  users.users.testu = {
    isNormalUser = true;
    description = "Test User";
    hashedPasswordFile = config.sops.secrets.testu-password.path;
  };

  sops.secrets.testu-password = {
    sopsFile = ../../secrets.yaml;
    neededForUsers = true;
  };
}
