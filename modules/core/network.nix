{ pkgs, host, ... }:
# Network configuration
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
  };
  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
