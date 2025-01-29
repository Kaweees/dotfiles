{
  config,
  pkgs,
  ...
}: {
  services.flatpak = {
    enable = true;
    packages = [
      # "io.github.zen_browser.zen"
      # "com.github.tchx84.Flatseal"
      # "io.github.everestapi.Olympus"
    ];
    overrides = {
      global = {
        # # Force Wayland by default
        # Context.sockets = [
        #   "wayland"
        #   "x11"
        #   "!fallback-x11"
        # ];
      };
    };
  };
}
