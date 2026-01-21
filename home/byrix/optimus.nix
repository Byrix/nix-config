{
  imports = [
    ./global
    ./features/config/colours.nix
    ./features/desktop/niri
    ./features/desktop/common
    ./features/productivity
  ];

  #  ---------
  # |  eDP-1  |
  #  --------- 
  monitors = [
    {
      name = "eDP-1";
      height = 1440;
      width = 1920;
      primary = true;
      position = { x=0; y=0; };
    }
  ];
}
