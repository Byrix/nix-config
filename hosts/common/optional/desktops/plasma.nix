{
  imports = [
    ./sddm.nix
  ];

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.desktopManager.plasma6.enable = true;
}
