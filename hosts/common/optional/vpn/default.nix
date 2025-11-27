{
  services.openvpn = {
    restartAfterSleep = true;
    servers = {
      regular = {
        config = "config /etc/openvpn/client/client.ovpn";
        autoStart = true;
        updateResolvConf = true;
        authUserPass = "";
      };
    };
  };
}
