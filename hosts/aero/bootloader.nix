{pkgs, ...}:
# Bootloader configuration
{
  boot.loader = {
    timeout = 10;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    grub.enable = false; # Disable GRUB completely
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
