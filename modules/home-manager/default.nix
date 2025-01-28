{
  inputs,
  username,
  host,
  ...
}:
{
  imports = [
    ../core/default.nix
    ../home/default.nix
  ];
}
