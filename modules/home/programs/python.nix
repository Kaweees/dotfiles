{ pkgs, ... }: { home.packages = with pkgs; [ uv python310 ]; }
