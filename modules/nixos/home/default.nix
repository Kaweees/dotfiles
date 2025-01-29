{
  inputs,
  username,
  host,
  pkgs,
  ...
}: {
  imports = [
    ./vscode.nix # code editor
    ./fzf.nix # fuzzy finder
    ./git.nix # version control
    # ./nvim.nix # neovim editor
    # ./tmux.nix # terminal multiplexer
    # ./wayland.nix # Wayland-based desktop environment
    ./zsh.nix # shell
  ];
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];
}
