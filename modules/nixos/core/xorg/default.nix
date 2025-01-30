{pkgs, ...}: {
  # List your module files here
  imports = [
    ./xserver.nix # Xorg-based desktop environment
  ];
}
