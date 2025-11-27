{ lib, config, ... }:
let
  inherit lib;
  cfg = config.vpn;
in {
  options.vpn = {
    profiles = mkOption {
      default = {};
      type = types.submodule {
        options = {
          name = mkOption { type = types.str; };
          auth = mkOption {
            type = types.oneOf [
              types.singleLineStr
              (types.submodule {
                options = {
                  username = mkOption { type = types.str; };
                  password = mkOption { type = types.str; };
                };
              })
            ];
          };
        };
      };
    };
  };

  config = {}
}
