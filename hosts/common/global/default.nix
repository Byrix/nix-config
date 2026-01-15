{ inputs, outputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./nix.nix
    ./grub-boot.nix
    ./locale.nix

    ./yubikey.nix
    ./openssh.nix

    ./colours.nix

    ./gamemode.nix
    ./steam-hardware.nix
  ];
  # ++ (builtins.attrValues outputs.nixosModules);

  home-manager.useGlobalPkgs = true;
  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
  };

  nixpkgs = {
    # overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  networking.domain = "byrix.dev";
}
