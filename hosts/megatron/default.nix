{
  config,
  pkgs,
  inputs,
  ...
}:
{
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

  networking =
    let
      eth = "enp34s0";
    in
    {
      hostName = "megatron";
      defaultGateway = {
        address = "192.168.1.1";
        interface = eth;
      };
      interfaces."${eth}" = {
        name = "eth-solaris";
        ipv4.addresses = [
          {
            address = "192.168.1.10";
            prefixLength = 24;
          }
        ];
      };
    };

  programs.firefox.enable = true;
  hardware = {
    graphics.enable = true;
    nvidia.open = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
