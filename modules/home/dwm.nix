{ pkgs, ... }:

{
  services.xserver.displayManager.defaultSession = "none+dwm";
  services.xserver.windowManager.dwm = {
    enable = true;
    defaultSession = "none+dwm";
    package = pkgs.dwm.overrideAttrs (oldAttrs: {
      src = ../config/dwm;
    });
  };

  environment.systemPackages = with pkgs; [
    dwm
    pciutils
    dunst
    rofi
  ];
}
