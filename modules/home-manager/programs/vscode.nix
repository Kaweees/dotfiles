{pkgs, ...}:
# VSCode editor configuration
{
  programs.vscode = {
    enable = true;
  };
  home.packages = with pkgs; [
    vscode
  ];
}
