{ pkgs, inputs, ... }:
{
  imports = [ 
    inputs.hardware.nixosModules.common-gpu-nvidia
    inputs.hardware.nixosModules.common-cpu-amd 
    inputs.hardware.nixosModules.common-pc-sdd
    ./hardware-configuration.nix

    ../common/global
    ../common/optional/gamemode.nix 
    ../common/optional/peripherals.nix 
    ../common/optional/pipewire.nix 
  ];

  networking = {
    hostName = "megatron";
    useDHCP = true;
  };

  hardware.graphics.enable = true;
  system.stateVersion = "22.05";
}
