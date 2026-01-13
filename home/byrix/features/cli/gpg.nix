{ pkgs, config, lib, ... }: {
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

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
      publicKeys = [{
        source = ../../pgp.asc;
        trust = 5;
      }];
    };
  };
}