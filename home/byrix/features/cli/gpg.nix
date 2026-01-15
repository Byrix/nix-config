{ pkgs, config, lib, ... }: {

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    pinentry.package = pkgs.pinentry-curses;
    pinentry.program = "pinentry";
  };

  home.sessionVariables = {
    GPG_TTY = "$(tty)";
    FOO = "bar";
  };
  programs = let 
    fixGpg = "gpgconf --launch gpg-agent";
  in {
    # Auto start gpg-agent if not already running (or tunneled)
    # https://www.gnupg.org/faq/whats-new-in-2.1.html#autostart
    # NOTE: Must update for extra shells as / if added
    bash.profileExtra = fixGpg;
    bash.bashrcExtra = "export GPG_TTY=$(tty)";
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