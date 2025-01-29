{ inputs, pkgs, ... }:
# GitHub CLI configuration
{
  programs.gh = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    gh
  ];
}
