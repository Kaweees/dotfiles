{pkgs, ...}: {
  # Add your system-wide programs here
  environment.systemPackages = with pkgs; [
    # Add any packages you want to install system-wide
  ];
}
