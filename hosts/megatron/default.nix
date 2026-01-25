{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd
    ./hardware-configuration.nix
    ./drives.nix

    ../common/global
    ../common/users/byrix

    ../common/optional/desktops/niri.nix
    ../common/optional/desktops/plasma.nix
    ../common/optional/gamemode.nix
    ../common/optional/pipewire.nix
    ../common/optional/steam.nix
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

  networking.hostName = "megatron";
  networking.networkmanager.enable = true;

  programs.firefox.enable = true;
  hardware = {
    graphics.enable = true;
    nvidia.open = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
