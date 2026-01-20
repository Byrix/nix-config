{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.dell-xps-13-9315
    ./hardware-configuration.nix

    ../common/global
    ../common/users/byrix

    # ../common/optional/desktops/gnome.nix
    ../common/optional/desktops/sddm.nix
    ../common/optional/pipewire.nix
    ../common/optional/docker.nix
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

  hardware.graphics.enable = true;
  programs.firefox.enable = true;
}
