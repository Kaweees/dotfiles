{pkgs, ...}: {
  # List your module files here
  imports = [
    ./xserver.nix
    ./dwm.nix
  ];

  fonts.fonts = with pkgs; [maple-mono fira-code];
}
