{pkgs, ...}: {
  home.packages = with pkgs; [
    gnumake
    gcc
    gdb
    clang-tools
    cmake
    qemu
    zig
    picocom
    openocd
  ];
}
