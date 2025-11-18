{ config, ... }:
{
  xdg.mimeApps = {
    associations.added = {
      "x-scheme-handler/terminal" = "Alacritty.desktop";
    };
    defaultApplications = {
      "x-scheme-handler/terminal" = "Alcritty.desktop";
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = config.fontProfiles.monospace.size;
        normal = {
          family = config.fontProfiles.monospace.name;
          style = config.fontProfiles.monospace.regular;
        };
        bold = {
          family = config.fontProfiles.monospace.name;
          style = config.fontProfiles.monospace.bold;
        };
        italic = {
          family = config.fontProfiles.monospace.name;
          style = config.fontProfiles.monospace.italic;
        };
      };

      window.dynamic_padding = true;
      env.TERM = "xterm-256color";

      colors = let
        colour = col: "#${config.colourScheme.palette."${col}"}";
      in {
        primary = {
          background = colour "base00";
          foreground = colour "base05";
          dim_foreground = colour "base04";
          bright_foreground = colour "base06";
        };

        cursor = {
          text = colour "base00";
          cursor = colour "base06";
        };

        vi_mode_cursor = {
          text = colour "base00";
          cursor = colour "base07";
        };

        search = {
          matches = {
            foreground = colour "base00";
            background = colour "base04";
          };

          focused_match = {
            foreground = colour "base00";
            background = colour "base0B";
          };
        };

        footer_bar = {
          foreground = colour "base00";
          background = colour "base04";
        };

        hints = {
          start = {
            foreground = colour "base00";
            background = colour "base0A";
          };
          end = {
            foreground = colour "base00";
            background = colour "base04";
          };
        };

        selection = {
          text = colour "base05";
          background = colour "base00";
        };

        normal = {
          black = colour "base03";
          red = colour "base08";
          green = colour "base0B";
          yellow = colour "base0A";
          blue = colour "base0D";
          magenta = colour "base0E";
          cyan = colour "base0C";
          white = colour "base04";
        };
        bright = {
          black = colour "base03";
          red = colour "base08";
          green = colour "base0B";
          yellow = colour "base0A";
          blue = colour "base0D";
          magenta = colour "base0E";
          cyan = colour "base0C";
          white = colour "base04";
        };
      };
    };
  };
}
