{ ... }:
{
  programs = {
    # on macOS, you probably don't need this
    bash = {
      enable = true;
      initExtra = ''
        # Custom bash profile goes here
      '';
    };

    zsh = {
      enable = true;
      # Point to your custom zsh directory
      dotDir = "../../../zsh";
    };
  };
}
