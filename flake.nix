{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    systems.url = "github:nix-systems/default-linux";
    hardware.url = "github:nixos/nixos-hardware";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin.url = "github:catppuccin/nix/release-25.11";
    direnv-instant.url = "github:Mic92/direnv-instant";
    niri.url = "github:sodiboo/niri-flake";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      systems,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs (import systems) (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      );
    in
    {
      inherit lib;
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home;

      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });
      formatter = forEachSystem (pkgs: pkgs.nixfmt-rfc-style);
      overlays = import ./overlays { inherit inputs outputs; };

      nixosConfigurations = {
        # Desktop
        megatron = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/megatron ];
        };
        # Laptop
        optimus = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/optimus ];
        };
        rlyeh = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/rlyeh ];
        };
        giga = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/giga ];
        };
      };

      homeConfigurations = {
        # Laptop
        "byrix@optimus" = lib.homeManagerConfiguration {
          modules = [
            ./home/byrix/optimus.nix
            ./home/common/nixpkgs.nix
          ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
        };
      };
    };
}
