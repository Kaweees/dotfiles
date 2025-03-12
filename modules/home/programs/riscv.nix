{pkgs, ...}: {
  home.packages = with pkgs; [
    pkgsCross.riscv64.coreutils
    # pkgsCross.riscv64-embedded
  ];
}
