{ config, ... }: {
  imports = [
    ./global
    ./features/config/colours.nix
    ./features/desktop/common
    ./features/productivity
  ];

  programs.direnv.config = {
    whitelist.prefix = [
      "${config.home.homeDirectory}/Documents/homelab"
    ];
  };
}
