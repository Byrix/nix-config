{ lib, ... }:
{
  time.timeZone = lib.mkDefault "Australia/Melbourne";
  services.automatic-timezoned.enable = true;
  i18n.defaultLocale = lib.mkDefault "en_AU.UTF-8";
}
