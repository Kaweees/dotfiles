{
  inputs,
  username,
  hostname,
  pkgs,
  ...
}: {
  # List your module files here
  imports = [
    ./docker.nix # docker
    ./fzf.nix # fuzzy finder
    ./git.nix # version control
    ./vscode.nix # code editor
    # ./nvim.nix # neovim editor
    # ./tmux.nix # terminal multiplexer
    # ./wayland.nix # Wayland-based desktop environment
    # ./zsh.nix # shell
  ];
}
