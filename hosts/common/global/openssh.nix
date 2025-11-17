{ outputs, lib, config, ... }:
let
  hosts = lib.attrames outputs.nixosConfigurations;

  # Sops needs access to keys before persist dirs are even mounted; so
  # just persisting the keys won't work, we must point at /persist 
  hasOptInPersistence = config.environment.persistence ? "/persist";
in {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";

      # Remove stale sockets 
      StreamLocalBindUnlink = "yes";
      # Allow forwarding ports to everywhere
      GatewayPorts = "clientspecified";
      # Let WAYLAND_DISPLAY be forwarded
      AcceptEnv = "WAYLAND_DISPLAY";
      X11Forwarding = true;
    };

    hostKeys = [
      {
        path = "${lib.optionalString hasOptInPersistence "/persist"}/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
  };

  programs.ssh = {
    # Each host public key 
    knownHosts = lib.genAttrs hosts (hostname: {
      publicKeyFile = ../../${hostname}/ssh_host_ed25519_key.pub;
      extraHostNames = [
        "${hostname}.byrix.dev"
      ]
      ++ (lib.optional (hostname == config.networking.hostName) "localhost")
      ++ (lib.optionals (hostname == "megatron") [
          "byrix.dev"
          "git.byrix.dev"
        ]);
      });
    };
}
