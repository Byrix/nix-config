{ config, lib, pkgs, ... }: {
  environment.systemPackages = [ pkgs.yubikey-personalization ];
  services.udev.packages = [ pkgs.yubikey-personalization ];
}