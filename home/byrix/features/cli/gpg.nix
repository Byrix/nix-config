{ pkgs, config, lib, ... }: {
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    # TODO: Gen keys
    sshKeys = [];
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
        # TODO: Again gen keys
        source = ../../pgp.asc;
        trust = 5;
      }];
    };
  }
}