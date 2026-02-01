{ inputs, pkgs, ... }:
{
  # imports = [ inputs.catppuccin.nixosModules.catppuccin ];

  # catppuccin = {
  #   enable = true;
  #   flavor = "macchiato";
  #   accent = "green";
  # };

  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
  };

  qt = {
    style.name = "kvantum";
    # platformTheme.name = "kvantum";
  };
}
