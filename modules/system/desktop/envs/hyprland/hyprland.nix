{ config, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    # nvidiaPatches = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    # WLR_NO_HARDWARE_CUSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    # OpenGL
    opengl.enable = true;
    # Nvidia settings 
    # nvidia.modesetting.enable = true;
  };

  environment.systemPackages = with pkgs; [
    (pkgs.waybar.overrideAttrs( oldAttrs: { 
        mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
      })
    )
    eww
    dunst
  ];

  imports = [
    ../services/notification/dunst.nix
    ../desktop/
  ]



  # Waybar
}
