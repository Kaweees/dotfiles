{pkgs, ...}: {
  # Network-related packages for the user
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
