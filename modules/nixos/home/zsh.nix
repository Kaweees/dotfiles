{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    # ohMyZsh = {
    #   enable = true;
    #   theme = "agnoster";
    #   plugins = [ "git" "z" "sudo" ];
    # };
    # dotDir = ".config/zsh";
  };

  environment.systemPackages = with pkgs; [
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
