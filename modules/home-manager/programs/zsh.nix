{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    # ohMyZsh = {
    #   enable = true;
    #   theme = "agnoster";
    #   plugins = [ "git" "z" "sudo" ];
    # };
    # dotDir = ".config/zsh";
  };

  home.packages = with pkgs; [
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
