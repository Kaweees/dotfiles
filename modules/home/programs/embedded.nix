{pkgs, ...}: {
  home.packages = with pkgs; [
    gnumake
    gcc
    clang-tools
    cmake
    qemu
    zig
  ];
}
