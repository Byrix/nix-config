{
  inputs = {
    nixpkgs.url = "github:nixos/nixos-unstable";
    systems.url = "gitub:nix-systems/default-linux";
    hardware.url = "github:nix-systems/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colours.url = "github:misterio77/nix-colors";

    impermanence = {
      url = "github:nix-community/impermanence";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devshell.url = "github:numtide/devshell";
  };

  outputs = { self, nixpkgs, home-manager, systems, ... } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    pkgsFor = lib.genAttrs (import systems) (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      );
    forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
  in {
    inherit lib;
    nixosModules = import ./modules/system;
    homeManagerModules = import ./modules/home;

    overlays = import ./overlays { inherit inputs outputs; };
    packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });
    shells = forEachSystem (pkgs: import ./shells { inherit pkgs; });

    nixosConfigurations = {
      # Desktop
      megatron = lib.nixosSystem {
        modules = [ ./hosts/megatron ];
        specialArgs = { inherit inputs outputs; };
      };
    };
  };
}
