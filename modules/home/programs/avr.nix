{ pkgs, ... }: {
  home.packages = with pkgs; [
    avrdude
    pkgsCross.avr.libcCross
    pkgsCross.avr.buildPackages.gcc
  ];
}
