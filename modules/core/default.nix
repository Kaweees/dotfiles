# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.

{
  # List your module files here
  imports = [
    ./bootloader.nix
    ./hardware.nix
    ./xorg.nix # Xorg-based desktop environment
    ./network.nix
    ./nvidia.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./flatpak.nix
    ./user.nix
    ./virtualization.nix
    # ./wayland.nix # Wayland-based desktop environment
  ];

  fonts.fonts = with pkgs; [ maple-mono fira-code ];
}
