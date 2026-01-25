{ inputs, pkgs, lib, config, ... }: {
  imports = [
    inputs.niri.homeModules.niri
    ./keybinds.nix
    ./windows.nix

    ../common/tofi.nix
    ../common/waybar.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;

    settings = {
      prefer-no-csd = true;
      hotkey-overlay.skip-at-startup = true;

      outputs = lib.listToAttrs (map (m: {
        name = m.name;
        value = {
          mode = {
            width = m.width;
            height = m.height;
            refresh = (0.0 + m.refreshRate); # Refresh rate expects float
          };
          scale = m.scale;
          position = m.position;
          focus-at-startup = m.primary;
        };
      }) (config.monitors));

      input = {
        keyboard.numlock = true;
        touchpad.tap = true;
        touchpad.natural-scroll = true;

        warp-mouse-to-focus = {
          enable = true;
          mode = "center-xy";
        };
        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "10%";
        };
      };
    };
  };

  home.packages = with pkgs; [ xwayland-satellite ];

  services.mako.enable = true;
}
