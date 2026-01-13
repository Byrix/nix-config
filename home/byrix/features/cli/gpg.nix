{ pkgs, config, lib, ... }: {
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    sshKeys = [ "382C283A99CB9AF9" ];
    enableExtraSocket = true;
    pinentry.package = 
      if config.gtk.enable 
      then pkgs.pinentry-gnome3
      else pkgs.pinentry-tty;
  };

  home.packages = lib.optional config.gtk.enable pkgs.gcr;

  programs = let 
    fixGpg = 
      /* bash */
      ''gpgconf --launch gpg-agent'';
  in {
    # Auto start gpg-agent if not already running (or tunneled)
    # https://www.gnupg.org/faq/whats-new-in-2.1.html#autostart
    # NOTE: Must update for extra shells as / if added
    bash.profileExtra = fixGpg;
    zsh.loginExtra = fixGpg;

    gpg = {
      enable = true;
      settings.trust-model = "tofu+pgp";
      publicKeys = [{
        source = ../../pgp.asc;
        trust = 5;
      }];
    };
  };
}