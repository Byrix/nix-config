{ lib, ... }:
{
  networking = {
    domain = "byrix.dev";
    useDHCP = lib.mkDefault true;
    networkmanager.enable = lib.mkDefault true;
  };
}
