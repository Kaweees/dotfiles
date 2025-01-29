{
  config,
  pkgs,
  inputs,
  username,
  host,
  ...
}: {
  # User configuration
  users.users.${username} = {
    initialPassword = "${username}";
    isNormalUser = true;
    description = "${username}";
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
    ];
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  # Allow user to use nix
  nix.settings.allowed-users = ["${username}"];
}
