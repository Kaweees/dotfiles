# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  stateVersion,
  username,
  hostname,
  lib,
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example
    inputs.home-manager.nixosModules.home-manager

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    ./users.nix

    # Import generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix

    # Bootloader settings
    ./bootloader.nix

    # NixOS modules
    outputs.nixosModules.core
    outputs.nixosModules.hardware
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      inputs.nur.overlays.default

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs username hostname stateVersion;
    };
    users.${username} = {
      imports = [./home.nix];
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Enable auto optimization
      auto-optimise-store = true;
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
      # Add substituters
      substituters = ["https://nix-gaming.cachix.org"];
      trusted-public-keys = [
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    };
    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  services = {
    openssh = {
      # Enable SSH server
      enable = true; # Enable SSH server
      settings = {
        # Forbid root login through SSH.
        PermitRootLogin = "no";
        # Use keys only.
        # Remove if you want to SSH using passwords
        # PasswordAuthentication = false;
      };
    };
    flatpak = {
      enable = true;
      packages = [
        # "io.github.zen_browser.zen"
        # "com.github.tchx84.Flatseal"
        # "io.github.everestapi.Olympus"
      ];
      overrides = {
        global = {
          # Force Wayland by default
          # Context.sockets = [
          #   "wayland"
          #   "x11"
          #   "!fallback-x11"
          # ];
        };
      };
    };
    dbus.enable = true;
    fstrim.enable = true;
  };

  boot = {
    kernelModules = ["i915" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
    kernelParams = [
      "nvidia-drm.modeset=1"
      "i915.force_probe=46a6"
      "pcie_aspm=force"
    ];
    initrd.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
  };

  # Network configuration
  networking = {
    hostName = hostname;
    networkmanager = {
      enable = true;
    };
  };

  # Security configuration
  security = {
    sudo = {
      enable = true; # Enable sudo with wheel group
      wheelNeedsPassword = false; # Allow sudo without password for wheel group
    };
    rtkit.enable = true;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    fira-code
    fira-code-symbols
    nerdfonts
    maple-mono
    noto-fonts
    noto-fonts-emoji
    gcr
    gnome.gnome-settings-daemon
    code-cursor
  ];

  fonts = {
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      nerdfonts
      maple-mono
      noto-fonts
      noto-fonts-emoji
    ];

    fontconfig.enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      common.default = ["gtk"];
    };
  };

  programs.zsh = {
    enable = true;  # Enable ZSH system-wide
  };

  # Set your time zone and locale
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  # System state version
  system.stateVersion = stateVersion;

}
