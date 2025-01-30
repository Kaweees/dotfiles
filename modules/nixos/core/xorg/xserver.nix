# X11 and Suckless configuration
{
  pkgs,
  username,
  ...
}: {
  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      exportConfiguration = true;
      xkb.layout = "us";

      # Display manager configuration
      displayManager = {
        autoLogin = {
          enable = true;
          user = "${username}";
        };
      };

      libinput = {
        enable = true;
      };
    };
  };

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
  environment.systemPackages = with pkgs; [
    xorg.xinit
    xorg.xmodmap
    xorg.xsetroot
    xorg.xrandr
    xorg.xrdb
    dunst
    picom
    autorandr
    numlockx
  ];
}
