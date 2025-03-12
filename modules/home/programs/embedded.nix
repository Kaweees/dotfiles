{pkgs, ...}: {
  home.packages = with pkgs; [
    gnumake
    gcc
    clang-tools
    cmake
    qemu
    avrdude
    pkgsCross.avr.libcCross
    pkgsCross.avr.buildPackages.gcc
    zig
  ];
}
