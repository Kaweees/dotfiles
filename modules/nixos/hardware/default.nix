{pkgs, ...}: {
  # List your module files here
  imports = [
    ./audio.nix # Audio configuration
    # ./nvidia.nix # NVIDIA GPU drivers
    # ./intel.nix # Intel GPU drivers
  ];
}
