{ lib, ... }:
{
  networking = {
    domain = "home.arpa";
    useDHCP = lib.mkDefault true;
  };
}
