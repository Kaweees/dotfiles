{ pkgs, ... }:
# Git configuration
{
  programs.git = {
    enable = true;

    userName = "Miguel Villa Floran";
    userEmail = "miguel.villafloran@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = true;
        diff-so-fancy = true;
        navigate = true;
      };
    };
  };
  home.packages = [ pkgs.git ]; # pkgs.git-lfs
}
