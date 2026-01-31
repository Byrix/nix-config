{ lib, ... }:
{
  time.timeZone = lib.mkDefault "Australia/Melbourne";
  i18n.defaultLocale = lib.mkDefault "en_AU.UTF-8";
}
