{ pkgs, username, ... }:
# X11 and Suckless configuration
{
  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      exportConfiguration = true;
      xkb.layout = "us";
      windowManager.dwm = {
        enable = true;
        package = pkgs.dwm.overrideAttrs (oldAttrs: {
          src = ../config/dwm;
        });
      };
      # Enable Nvidia drivers
      videoDrivers = [ "nvidia" ];
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };
    libinput = {
      enable = true;
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
  environment.systemPackages = with pkgs; [
    dwm
    xorg.xinit
    xorg.xmodmap
    xorg.xsetroot
  ];
}
