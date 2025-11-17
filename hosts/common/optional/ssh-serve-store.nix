{
  nix = {
    sshServe = {
      enable = true;
      keys = [
        # TODO: Key
      ];
      protocol = "ssh";
      write = true;
    };
    settings.trusted-users = ["nix-ssh"];
  };
}
