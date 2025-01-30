{
  description = "NixOS system configurations";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Add nix-flatpak input
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    # Add NUR input
    nur.url = "github:nix-community/NUR";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nix-flatpak,
    home-manager,
    ...
  } @ inputs: let
    username = "kaweees";
    hostname = "aero";
    stateVersion = "24.11";
    inherit (self) outputs;
    # Supported systems for your flake packages, shell, etc.
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};
    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#<hostname>'
    nixosConfigurations = {
      ${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs username hostname stateVersion;
          pkgs-unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
        };
        modules = [
          # > Our main nixos configuration file <
          ./hosts/${hostname}/configuration.nix
          inputs.nix-flatpak.nixosModules.nix-flatpak
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#<username>@<hostname>'
    homeConfigurations = {
      "${username}@${hostname}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {
          inherit inputs outputs username hostname stateVersion;
          pkgs-unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
        };
        modules = [
          # > Our main home-manager configuration file <
          ./hosts/${hostname}/home.nix
        ];
        useUserPackages = true;
        useGlobalPkgs = true;
      };
    };
  };
}
