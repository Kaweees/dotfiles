# X11 and Suckless configuration
{
  pkgs,
  username,
  ...
}: let
  xinitrcContent = builtins.readFile ./xorg/.xinitrc;
  xresourcesContent = builtins.readFile ./config/xorg/.Xresources;
in {
  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      exportConfiguration = true;
      xkb.layout = "us";
      xresources = xresourcesContent;
    };

    displayManager = {
      startupScript = xinitrcContent;
      autoLogin = {
        enable = true;
        user = "${username}";
      };
    };

    libinput = {
      enable = true;
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
  environment.systemPackages = with pkgs; [
    xorg.xinit
    xorg.xmodmap
    xorg.xsetroot
    dunst
    picom
    xrdb
    autorandr
    numlockx
    slstatus
  ];
}
