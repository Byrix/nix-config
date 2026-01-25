{ ... }: {
  programs.niri.settings = {
    layout = {
      gaps = 16;
      background-color = "#24273a";

      default-column-width = { proportion = 1. / 3.; };
      preset-column-widths = [
        { proportion = 1. / 3.; }
        { proportion = 1. / 2.; }
        { proportion = 2. / 3.; }
        { proportion = 1.; }
      ];

      border = {
        width = 2;
        # active = "#a6da95";
        inactive = { color = "#6e738d"; };
        urgent = { color = "#ee99a0"; };
      };

      focus-ring = {
        width = 2;
        active = { color = "#c6a0f6"; };
      #   inactive = "#6e738d";
      #   urgent = "#ed8796";
      };

      struts = {
        top = 4;
        bottom = 4;
        left = 2;
        right = 2;
      };
    };
  };
}
