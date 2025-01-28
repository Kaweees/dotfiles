# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.

{
  # List your module files here
  imports = [
    ../core/bootloader.nix
    ../core/hardware.nix
    ../core/xserver.nix
    ../core/network.nix
    ../core/pipewire.nix
    ../core/program.nix
    ../core/security.nix
    ../core/system.nix
    ../core/flatpak.nix
    ../core/user.nix
    ../core/virtualization.nix
  ];
}
