# https://nixos.wiki/wiki/Nvidia
{
  config,
  pkgs,
  ...
}: {
  # Enable NVIDIA proprietary drivers for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    # NVIDIA Configuration
    nvidia = {
      modesetting.enable = true; # Required for PRIME sync (for wayland)
      powerManagement.enable = true; # GPU power management
      powerManagement.finegrained = false; # More aggressive power management
      open = false; # Keep closed source drivers
      nvidiaSettings = true; # Enable NVIDIA settings GUI

      # Prime configuration for Intel/NVIDIA switch
      prime = {
        sync.enable = true; # Enable Optimus PRIME Sync Mode
        # Bus ID of Intel and NVIDIA GPUs (verify with lspci)
        intelBusId = "PCI:0:2:0"; # Intel Iris Xe Graphics (8086:46A6)
        nvidiaBusId = "PCI:1:0:0"; # RTX 3070 Ti (10DE:24A0)
        # enableOffloadCmd = true; # For AMD GPUs
      };

      # Enable experimental features if needed
      # experimentalFeatures.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };

    # Intel GPU configuration (12th Gen)
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        (vaapiIntel.override {enableHybridCodec = true;})
        vaapiVdpau
        libvdpau-va-gl
        colord
      ];
    };
  };

  # Kernel configuration
  boot = {
    kernelModules = ["i915" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" "iwlwifi"];
    kernelParams = [
      "nvidia-drm.modeset=1" # Required for PRIME sync
      "i915.force_probe=46a6" # Force probe Intel 12th Gen GPU
      "pcie_aspm=force" # Better power management
      "i915.enable_psr=0" # Fix screen flickering
    ];
    # Enable early KMS for NVIDIA
    initrd.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
  };

  # Environment variables and packages for NVIDIA
  environment = {
    variables = {
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      LIBVA_DRIVER_NAME = "nvidia"; # For hardware video acceleration
      NVD_BACKEND = "direct"; # Direct rendering mode
      WLR_NO_HARDWARE_CURSORS = "1"; # For Wayland compositors
      NIXOS_OZONE_WL = "1"; # Hint electron apps to use wayland
    };
    systemPackages = with pkgs; [
      cudaPackages.cuda_nvcc # CUDA tools (optional)
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
      libva-utils
    ];
  };

  # Power management
  services = {
    # For Intel CPU power management
    thermald.enable = true;
  };
}
