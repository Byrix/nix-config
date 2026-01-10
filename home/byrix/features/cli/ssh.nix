{ outputs, lib, config, pkgs, ... }: 
let
  nixosConfigs = builtins.attrNames outputs.nixosConfigurations;
  homeConfigs = map (n: lib.last (lib.splitString "@" n)) (builtins.attrNames outputs.homeConfigurations);
  hostnames = lib.unique (homeConfigs ++ nixosConfigs);
in {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      net = {
        host = lib.concatStringsSep " " (lib.flatten (map (host: [
            host
            "${host}.byrix.dev"
          ])
          hostnames));
      };
    };
  };
}