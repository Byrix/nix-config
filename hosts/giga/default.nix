{ ... }: {
  imports = [ 
    ./hardware-configuration.nix

    ../common/global
    ../common/users/byrix
  ];

  networking.hostName = "giga";
  networking.networkmanager.enable = true;

  system.stateVersion = "25.05";
}

