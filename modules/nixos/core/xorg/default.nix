{pkgs, ...}: {
  # List your module files here
  imports = [
    ./xserver.nix
    ./dwm.nix
  ];
}
