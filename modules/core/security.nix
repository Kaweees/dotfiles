{...}:
# Security configuration
{
  security = {
    sudo = {
      enable = true; # Enable sudo with wheel group
      wheelNeedsPassword = false; # Allow sudo without password for wheel group
    };
    rtkit.enable = true;
  };
}
