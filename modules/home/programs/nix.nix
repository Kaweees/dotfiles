{pkgs, ...}: {
  home.packages = with pkgs; [
    nix-instantiate
    nixfmt
    nix-build
    nix-env
    nix-channel
    nix-collect-garbage
    nix-daemon
    nix-env
  ];
}
