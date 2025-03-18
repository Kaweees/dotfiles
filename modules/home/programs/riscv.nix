{ pkgs, ... }: {
  home.packages = with pkgs; [
    # # Linux GNU toolchain (for applications running on Linux)
    # pkgsCross.riscv64.buildPackages.gcc
    # pkgsCross.riscv64.buildPackages.binutils

    # Embedded/bare-metal toolchain (for microcontrollers and systems without OS)
    pkgsCross.riscv64-embedded.buildPackages.gcc
    pkgsCross.riscv64-embedded.buildPackages.binutils
  ];
}
