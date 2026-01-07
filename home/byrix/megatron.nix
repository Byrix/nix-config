{ pkgs, ... }: {
    imports = [
        ./global
        ./configs/games
        ./configs/cli
    ];
}
