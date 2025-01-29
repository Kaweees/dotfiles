# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.

{
  # List your module files here
  imports = [
    ./bootloader.nix
    ./hardware.nix
    ./xserver.nix
    ./network.nix
    ./nvidia.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./system.nix
    ./flatpak.nix
    ./user.nix
    ./virtualization.nix
  ];

  fonts.fonts = with pkgs; [ maple-mono fira-code ];
}
