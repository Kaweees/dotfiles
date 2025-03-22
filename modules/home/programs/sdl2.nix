{ pkgs, ... }: { home.packages = with pkgs; [ sdl2 SDL2.dev ]; }
