# https://github.com/nvmd/nixos-raspberrypi-demo
{ ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/users/byrix
  ];

  system.stateVersion = "25.05";
  networking.hostName = "rlyeh";

  boot = let
    kernelBundle = pkgs.linuxAndFirmware.v6_6_31;
  in {
    # loader.raspberryPi.firmwarePackage = kernelBundle.raspberrypifw;
    # loader.raspberryPi.bootloader = "kernel";
    kernelPackages = kernelBundle.linuxPackages_rpi5;
  };
}
