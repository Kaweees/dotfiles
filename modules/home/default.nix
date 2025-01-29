{inputs, username, host, ...}: {
  imports = [
    ./vscode.nix # code editor
    ./fzf.nix # fuzzy finder
    ./git.nix # version control
    # ./nvim.nix # neovim editor
    # ./tmux.nix # terminal multiplexer
    # ./wayland.nix # Wayland-based desktop environment
    # ./zsh.nix # shell
  ];
}

