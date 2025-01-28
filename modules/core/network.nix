{ pkgs, host, ... }:
# Network configuration
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
  };
}
