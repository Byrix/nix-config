# Home-level module for configuring user monitor setup
# Provides generic config template which can then serve
#   as single source of truth for implementation into WM
#   configs 
# See `home/byrix/megatron.nix` for example use
# or `home/byrix/features/desktop/niri` for example WM use

{ lib, config, ... }: let
  inherit (lib) mkOption types;
in {
  options.monitors = mkOption {
    default = [];
    type = types.listOf (types.submodule {
      options = {
        name = mkOption {
          type = types.str;
          example = "DP-1";
        };
        primary = mkOption {
          type = types.bool;
          default = false;
        };
        height = mkOption {
          type = types.int;
          example = 1920;
        };
        width = mkOption {
          type = types.int;
          example = 1080;
        };
        refreshRate = mkOption {
          type = types.int;
          default = 60;
        };
        position = mkOption {
          type = types.submodule {options = {
            x = mkOption {
              type = types.int;
              example = 0;
            };
            y = mkOption {
              type = types.int;
              example = 0;
            };
          };};
          example = { x = 0; y = 0; };
        };
        scale = mkOption {
          type = types.float;
          default = 1.0;
        };
        enabled = mkOption {
          type = types.bool;
          default = true;
        };
      };
    });
  };

  config.assertions = [{
    assertion = ((lib.length config.monitors) != 0) ->
      ((lib.length (lib.filter (m: m.primary) config.monitors)) == 1);
    message = "Exactly one monitor must be set to primary";
  }];
}