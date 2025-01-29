{inputs, username, host, ...}: {
  imports = [
    ./dwm.nix # window manager
    ./fzf.nix # fuzzy finder
    ./git.nix # version control
  ];
}
