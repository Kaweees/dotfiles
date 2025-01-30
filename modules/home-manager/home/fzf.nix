{ pkgs, ... }: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    fzf
  ];
}
