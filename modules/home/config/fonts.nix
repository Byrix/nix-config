{ lib, config, ... }:
let
  mkFontOption = kind: {
    name = lib.mkOption {
      type = lib.types.str;
      default = null;
      description = "Family name for ${kind} font profile";
      example = "Fira Code";
    };
    package = lib.mkOption {
      type = lib.types.package;
      default = null;
      description = "Package for ${kind} font profile";
      example = "pkgs.fire-code";
    };
    size = lib.mkOption {
      type = lib.types.int;
      default = 12;
      description = "Size in pixels for ${kind} font profile";
      example = "12";
    };
    regular = lib.mkOption {
      type = lib.types.str;
      default = "Regular";
      description = "Name of the standard variant for ${kind} font profile";
      example = "Regular";
    };
    bold = lib.mkOption {
      type = lib.types.str;
      default = "Bold";
      description = "Name of the bold variant for ${kind} font profile";
      example = "Bold";
    };
    italic = lib.mkOption {
      type = lib.types.str;
      default = "Italic";
      description = "Name of the italic variant for ${kind} font profile";
      example = "Italic";
    };
  };
  cfg = config.fontProfiles;
in {
  options.fontProfiles = {
    enable = lib.mkEnableOption "Whether to enable font profiles";
    monospace = mkFontOption "monospace";
    regular = mkFontOption "regular";
  };

  config = lib.mkIf cfg.enable {
    fonts.fontConfig.enable = true;
    home.packages = [
      cfg.monospace.package
      cfg.regular.package
    ];
  };
}
