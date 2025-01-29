{pkgs, ...}:
# Cursor editor configuration
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
  environment.systemPackages = with pkgs; [
    code-cursor
  ];
}
