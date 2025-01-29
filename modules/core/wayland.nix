{ inputs, pkgs, ... }:
# Wayland configuration
{
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.default;
    # portalPackage =
    #   inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };
  hardware = {
    # OpenGL
    opengl.enable = true;

    # Most wayland compositors require this
    nvidia.modesetting.enable = true;
  };
  # xdg.portal = {
  #   enable = true;
  #   xdgOpenUsePortal = true;
  #   config = {
  #     common.default = [ "gtk" ];
  #     hyprland.default = [
  #       "gtk"
  #       "hyprland"
  #     ];
  #   };
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-gtk
  #     # inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland
  #     # pkgs.xdg-desktop-portal-hyprland
  #   ];
  # };
}
