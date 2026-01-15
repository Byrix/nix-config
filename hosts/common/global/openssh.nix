{ outputs, lib, config, pkgs, ... }: 
let 
  hosts = lib.attrNames outputs.nixosConfigurations;
in {
  environment.systemPackages = with pkgs; [
    openssl
    gnupg
    pinentry-tty
    veracrypt
    opensc
    pcsc-tools
  ];

  services.openssh = {
    enable = true;
    settings = {
      # Security 
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      AllowGroups = [ "allowssh" ];

      # Remove stale sockets
      StreamLocalBindUnlink = "yes";
      # Allow forwarding ports 
      GatewayPorts = "clientspecified";
      # Forward WAYLAND_DISPLAY 
      AcceptEnv = "WAYLAND_DISPLAY";
      X11Forwarding = true;
    };

    hostKeys = [
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
  };

  users.groups.allowssh = {};

  programs.ssh = {
    knownHosts = lib.genAttrs hosts (hostname: {
      publicKeyFile = ../../${hostname}/ssh_host_ed25519_key.pub;
      extraHostNames = 
        [ "${hostname}.byrix.dev" ]
        ++ (lib.optional (hostname == config.networking.hostName) "localhost" );
    });
  };

  services.pcscd.enable = true;
}
