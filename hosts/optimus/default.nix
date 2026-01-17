{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.dell-xps-13-9315
    ./hardware-configuration.nix

    ../common/global
    ../common/users/byrix

    ../common/optional/pipewire.nix
  ];

  system.stateVersion = "25.05";

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
      };
    };
  };

  networking.hostName = "optimus";
  networking.networkmanager.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  hardware.graphics.enable = true;
}
