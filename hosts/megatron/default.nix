{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd
    ./hardware-configuration.nix

    ../common/global
    ../common/users/byrix

    ../common/optional/gamemode.nix
    ../common/optional/plasma.nix
    ../common/optional/pipewire.nix
    ../common/optional/steam.nix
    ../common/optional/grub-boot.nix
  ];

  system.stateVersion = "25.05";
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "megatron";
  networking.networkmanager.enable = true;

  programs.firefox.enable = true;
  hardware = {
    graphics.enable = true;
    nvidia.open = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
