{ lib, config, pkgs, ... }:
let
  rgb = colour: "rgb(${lib.removePrefix "#" colour})";
  rgba = colour: alpha: "rgba(${lib.removePrefix "#" colour}${alpha})";
in {
  imports = [
    ./style.nix
    ./keybinds.nix
    ./rules.nix
  ];
  
  xdg.portal = {
    extraPortals = [( pkgs.xdg-desktop-portal-hyprland.override { hyprland = config.wayland.windowManager.hyprland.package; } )];
    config.hyprland.default = [ "hyprland" "gtk" ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
      variables = [
        "DISPLAY"
        "HYPRLAND_INSTANCE_SIGNATURE"
        "WAYLAND_DISPLAY"
        "XDG_CURRENT_DESKTOP"
      ];
    };

    settings = {
      input = {
        kb_layout = "us";
        numlock_by_default = true;
        touchpad.natural_scroll = true;
        tablet = {
          # TODO: 
        };
      };

      monitor = map (
        m: "${m.name},${
          if m.enabled
          then "${toString m.width}x${toString m.height}@${toString m.refreshRate},${m.position},${toString m.scale}${
            if m.extraArgs != null
            then ",${m.extraArgs}"
            else ""
          }"
          else "disable"
        }"
      ) config.monitors;

      workspace = map ( 
        m: "${m.workspace},monitor:${m.name}, default:true, persistent:true ${
          if m.workspaceName != null
          then ", defaultName:${m.workspaceName}"
          else ""
        }"
      ) (
        lib.filter (m: m.enabled && m.workspace != null) config.monitors
      );

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = 1;
        disable_hyprland_logo = true;
        close_special_on_empty = true;
        # TODO: Test swallowing
        # enable_swallow = true;
        # swallow_regex = "(?i)(${lib.concatMapStringsSep "|" (lib.removeSuffix ".desktop") config.xdg.mimeApps.defaultApplications."x-scheme-handler/terminal"})";
      };
    };
  };
}
