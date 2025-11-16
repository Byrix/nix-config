{
  inputs = {
    nixpkgs.url = "github:nixos/nixos-unstable";
    devshell.url = "github:numtide/devshell";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix.url = "github:numtide/treefmt-nix";
    snowfall-lib = {
      url = "github:songpola/snowfallorg-lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dotfiles = {
      url = "github:byrix/dotfiles";
      flake = false;
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;

      channels-config = {
        allowUnfree = true;
      };

      snowfall = {
        namespaace = "byrix";
        meta = {
          name = "byrix";
          title = "byrix";
        };
      };

      alias = {
        shells.default = "byrix";
        templates.default = "devshell";
      };

      outputs-builder = channels: let
        treefmtConfig = { ... }: {
          projectRootFile = "flake.nix";
          programs = {
            alejandra.enable = true;
            stylua.enable = true;
            keep-sorted.enable = true;
            terraform.enable = true;
          };
          settings = {
            global.excludes = [ "inputs/**" ];
          };
        };
        treeFmtEval = inputs.treefmt-nix.lib.evalModules (channels.nixpkgs) (treefmtConfig { pkgs = channels.nixpkgs; });
      in {
        formatter = treeFmtEval.config.build.wrapper;
      };
    };
}
