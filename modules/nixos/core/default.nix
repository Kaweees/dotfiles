{pkgs, ...}: {
  # List your module files here
  imports = [
    ./xorg # Xorg-based desktop environment
    ./network.nix
    ./pipewire.nix
    ./program.nix
    ./services.nix
    # ./virtualization.nix
    # ./wayland.nix # Wayland-based desktop environment
  ];
}
