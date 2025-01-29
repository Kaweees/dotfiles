{pkgs, ...}: {
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName = "Miguel Villa Floran";
    userEmail = "miguel.villafloran@gmail.com";
  };
}
