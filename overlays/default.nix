{ outputs, inputs, ... }:
let
  addPatches = pkg: patches:
    pkg.overrideAttrs (oldAttrs: {
      patches = (oldAttrs.patches or []) ++ patches;
    }
  );
in {
  flake-inputs = final: _: {
    inputs = 
      builtins.mapAttrs (
        _: flake: let
          legacyPackges = (flake.legacyPackages or {}).${final.system} or {};
          packages = (flake.packages or {}).${final.system} or {};
        in 
          if legacyPackages != {}
          then legacyPackages 
          else packages
      ) inputs;
  };
} 
