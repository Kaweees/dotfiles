{pkgs, ...}: {
  # programs.fzf = {
  #   enable = true;

  #   enableZshIntegration = true;
  # };
  environment.systemPackages = with pkgs; [fzf];
}
