{ pkgs, lib, ... }: {
  home.packages = lib.mkMerge [
    (lib.mkIf (!pkgs.stdenv.isDarwin) [
      pkgs.gdb # Only include GDB on non-Darwin systems
    ])
    (lib.mkIf pkgs.stdenv.isDarwin [
      pkgs.lldb # Use LLDB on Darwin systems instead
    ])
  ];
}
