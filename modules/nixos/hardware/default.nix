{pkgs, ...}: {
  # List your module files here
  imports = [
    ./nvidia.nix # NVIDIA GPU drivers
  ];
}
