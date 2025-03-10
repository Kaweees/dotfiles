{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs
    nodePackages.yarn
    nodePackages.pnpm
    uv
    go
  ];
}
