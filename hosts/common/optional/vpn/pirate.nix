{
  services.openvpn.servers = {
    pirate = {
      config = "config /etc/openvpn/client/pirate.ovpn";
      updateResolvConf = true;
      authUserPass = config.
    };
  };
}
