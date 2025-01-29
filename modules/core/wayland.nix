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
  environment.systemPackages = with pkgs; [
    wayland
    wayland-protocols
  ];
}
