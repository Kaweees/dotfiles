{inputs, username, host, ...}: {
  imports = [
    ./fzf.nix # fuzzy finder
    ./git.nix # version control
  ];
}
