{ ... }: {
  imports = [ 
    ./hardware-configuration.nix

    ../common/global
    ../common/users/byrix
  ];

  networking.hostName = "giga";
  networking.networkmanager.enable = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  system.stateVersion = "25.05";
}

