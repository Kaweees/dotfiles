{pkgs, ...}: {
  # List your module files here
  imports = [
    ./bootloader.nix
    ./xorg # Xorg-based desktop environment
    ./network.nix
    ./nvidia.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./flatpak.nix
    # ./virtualization.nix
    # ./wayland.nix # Wayland-based desktop environment
  ];

  fonts.fonts = with pkgs; [maple-mono fira-code];
}
