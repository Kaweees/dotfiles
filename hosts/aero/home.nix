# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  username,
  hostname,
  stateVersion,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.default

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ../../modules/home-manager/programs
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";

    # targets.genericLinux.enable = true; # ENABLE THIS ON NON NIXOS SYSTEMS

    sessionVariables = {
      EDITOR = "nvim";
      GIT_EDITOR = "nvim";
    };

    file = let
      dotfilesDir = ../../.config;
      homeDir = "/home/${username}";
    in {
      # Symlink configuration files
      "htop" = {
        source = "${dotfilesDir}/htop";
        target = "${homeDir}/.config/htop";
      };
      "nvim" = {
        source = "${dotfilesDir}/nvim";
        target = "${homeDir}/.config/nvim";
      };
      "picom" = {
        source = "${dotfilesDir}/picom";
        target = "${homeDir}/.config/picom";
      };
      "tmux" = {
        source = "${dotfilesDir}/tmux";
        target = "${homeDir}/.config/tmux";
      };
      "xorg-xinitrc" = {
        source = "${dotfilesDir}/xorg/.xinitrc";
        target = "${homeDir}/.xinitrc";
      };
      "xorg-xresources" = {
        source = "${dotfilesDir}/xorg/.Xresources";
        target = "${homeDir}/.Xresources";
      };
      "zsh-zshrc" = {
        source = "${dotfilesDir}/zsh/.zshrc";
        target = "${homeDir}/.zshrc";
      };
      "zsh-zprofile" = {
        source = "${dotfilesDir}/zsh/.zprofile";
        target = "${homeDir}/.zprofile";
      };
      "wallpapers" = {
        source = "${dotfilesDir}/wallpapers";
        target = "${homeDir}/.config/wallpapers";
      };
      "scripts" = {
        source = "${dotfilesDir}/scripts";
        target = "${homeDir}/.scripts";
      };
      "dunst" = {
        source = "${dotfilesDir}/dunst";
        target = "${homeDir}/.config/dunst";
      };
      "rofi" = {
        source = "${dotfilesDir}/rofi";
        target = "${homeDir}/.config/rofi";
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = stateVersion;
}
