{ config, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "graphical-session.target";

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        output = map (m: m.name) (config.monitors);
        height = 20;
        margin = "0.4rem";
        reload_on_style_change = true;

        modules-left = [
          "custom/logo"
          "niri/workspaces"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "memory"
          "network"
          "wireplumber"
          "battery"
          "custom/power"
        ];

        "custom/logo" = {
          format = " 󱄅 ";
          tooltip = false;
        };
        "niri/workspaces" = {
          format = "{index}";
        };

        clock = {
          format = "󰥔 {:%I:%M %p}";
          format-alt = "󰃭 {:%a, %d %b %Y}";
          tooltip-format = "{calendar}";
        };

        tray.spacing = 10;
        memory = {
          interval = 5;
          format = "󰆼 {}%";
          max-legnth = 10;
        };
        network = {
          format-wifi = "{icon}";
          format-ethernet = "";
          format-disconnected = "󰤭";
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          interval = 5;
          nospacing = 1;
        };
        wireplumber = {
          format = "{icon}";
          format-bluetooth = "󰂰";
          format-muted = "󰝟";
          format-icons = {
            headphone = "󰋋";
            default = [
              "󰖀"
              "󰕾"
              ""
            ];
          };
          tooltip-format = "Volume: {volume}%";
          nospacing = 1;
          scroll-step = 1;
        };
        battery = {
          format = "{capacity}% {icon}";
          format-full = "Charged ";
          format-icons = {
            charging = [
              "󰢜"
              "󰂆"
              "󰂇"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
            default = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };
          states = {
            warning = 20;
            critical = 10;
          };
          tooltip = false;
          interval = 5;
        };
        "custom/power" = {
          format = " 󰐥 ";
          tooltip = false;
        };
      };
    };
  };
  catppuccin.waybar.enable = false;
}
