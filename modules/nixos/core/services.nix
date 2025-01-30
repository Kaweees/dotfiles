{pkgs, ...}: {
  services = {
    gvfs.enable = true;
    gnome = {
      gnome-keyring.enable = true;
    };
  };
  services.logind.extraConfig = ''
    # don't shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
