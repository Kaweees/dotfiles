{pkgs, ...}:
# Bootloader configuration
{
  boot.loader = {
    timeout = 10;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
      device = "nodev"; # For UEFI systems
    };
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
