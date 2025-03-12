{pkgs, ...}: {
  home.packages = with pkgs; [
    # # Linux GNU toolchain (for applications running on Linux)
    # pkgsCross.riscv64.buildPackages.gcc
    # pkgsCross.riscv64.buildPackages.binutils

    # Embedded/bare-metal toolchain (for microcontrollers and systems without OS)
    pkgsCross.riscv64-embedded.buildPackages.gcc
    pkgsCross.riscv64-embedded.buildPackages.binutils
  ];
  home.shellAliases = {
    riscv-gcc = "riscv64-unknown-elf-gcc";
    riscv64-unknown-elf-gcc = "riscv64-none-elf-gcc";
    riscv64-unknown-elf-ld = "riscv64-none-elf-ld";
    riscv64-unknown-elf-objdump = "riscv64-none-elf-objdump";
    riscv64-unknown-elf-objcopy = "riscv64-none-elf-objcopy";
    riscv64-unknown-elf-readelf = "riscv64-none-elf-readelf";
    riscv64-unknown-elf-nm = "riscv64-none-elf-nm";
    riscv64-unknown-elf-size = "riscv64-none-elf-size";
    riscv64-unknown-elf-strings = "riscv64-none-elf-strings";
    riscv64-unknown-elf-strip = "riscv64-none-elf-strip";
  };
}
