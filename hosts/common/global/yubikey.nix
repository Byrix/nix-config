{ config, lib, pkgs, ... }: {
  services.udev.packages = [ pkgs.yubikey-personalization ];

  security.pam = {
    u2f = {
      enable = true;
      settings = {
        cue = true;  # Require touch 
        authfile = "/home/byrix/.config/Yubico/u2f_keys";
      };
      control = "sufficient";
    };
    services = {
      login.u2fAuth = true;
      greetd.u2fAuth = true;
      sudo.u2fAuth = true;
      sudo.sshAgentAuth = true;
      hyprlock.u2fAuth = true;
    };
  };

  environment.systemPackages = with pkgs; [
    yubikey-manager
    pam_u2f
    opensc
    pcsc-tools
  ];

  # services.pcscd.enable = true;

  system.activationScripts.yubikey-setup = lib.stringAfter [ "users" ] ''
    mkdir -p /home/byrix/.config/Yubico
    if [ ! -f /home/byrix/.config/Yubico/u2f_keys ]; then
      echo "Creating u2f_keys file for byrix"
      touch /home/byrix/.config/Yubico/u2f_keys
      chown byrix:users /home/byrix/.config/Yubico/u2f_keys
      chmod 600 /home/byrix/.config/Yubico/u2f_keys
    fi
  '';
}