{ lib, config, pkgs, ... }:
with lib; let
  cfg = config.programs.prismlauncher;
in {
  config.programs.prismlauncher = {
    enable = mkEnableOption "Enable Prism Launcher";
    package = mkPackageOption pkgs "prismlauncher";


  };
}
