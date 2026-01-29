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
          format = "{icon} ";
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

    style = with config.fontProfiles; ''
       * {
         border: none;
         border-radius: 0;
         min-height: 0;
         font-family: ${monospace.name};
         font-size: ${toString monospace.size}pt;
       }

      window#waybar {
       background-color: @mantle;
       transition-property: background-coolor;
       transition-duration: 0.5s;
      }
      window#waybar.hidden { opacity: 0.5; }

      #workspaces { background-color: transparent; }
      #workspaces button {
       all: initial;
       min-width: 0;
       box-shadow: inset 0 -3px transparent;
       padding: 6px 18px;
       margin: 6px 3px;
       border-radius: 4px;
       background-color: @base;
       color: @text;
      }
      #workspaces button.active {
        color: @mantle;
        background-color: @text;
      }
      #workspaces button.hover {
        box-shadow: inherit;
        text-shadow: inherit;
        color: @base;
        background-color: @text;
      }
      #workspaces button.urgent { background-color: @red }
      #workspaces button.empty { color: @surface1; }

      #memory,
      #custom-power,
      #battery,
      #backlight,
      #wireplumber,
      #network,
      #clock,
      #tray {
        border-radius: 4px;
        margin: 6px 3px;
        padding: 6px 12px;
        background-color: @base;
        color: @mantle;
      }

      #memory { background-color: @peach; }
      #backlight { background-color: @peach; }
      #wireplumber { background-color: @yellow; }

      #custom-power {
        background-color: @flamingo;
        margin-right: 6px;
      }

      #custom-logo {
        padding: 0 7px 0 7px;
        margin-left: 5px;
        font-size: ${toString (monospace.size * 1.5)}pt;
        border-radius: 8px 0 0 8px;
        color: @sapphire;
      }

      #battery { background-color: @teal; }
      #battery.warning,
      #battery.critical,
      #battery.urgent {
        background-color: @red;
        color: @mantle;
      }
      #battery.charging {
        background-color: @green;
        color: @mantle;
      }

      #network {
        background-color: @teal;
        padding-right: 17px;
      }

      #clock {
        font-family: ${regular.name};
        background-color: @mauve;
      }
    '';
  };
}
