{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "Miguel Villa Floran";
    userEmail = "miguel.villafloran@gmail.com";
  };
  home.packages = with pkgs; [
    docker
    docker-compose
  ];
}
