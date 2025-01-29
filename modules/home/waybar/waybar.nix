{pkgs, ...}:
# Status bar configuration
{
  programs.waybar = {
    enable = true;
  };
  programs.waybar.package = pkgs.waybar.overrideAttrs (oldAttrs: {
    mesonFlags = (oldAttrs.mesonFlags or []) ++ ["-Dexperimental=true"];
  });
}
