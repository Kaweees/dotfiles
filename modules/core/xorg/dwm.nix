{pkgs, ...}: {
  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.overrideAttrs (oldAttrs: {
      src = ../config/dwm;
    });
  };

  environment.systemPackages = with pkgs; [
    dwm
    pciutils
    rofi
  ];
}
