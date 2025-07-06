{
  description = "NixOS 25.05 flake (multi-host, modular)";
  inputs = {
    # Use NixOS 25.05 stable and NixOS unstable for latest packages, plus agenix for secrets
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, agenix }:
    let
      system = "x86_64-linux";
      # Overlay to include unstable nixpkgs as an 'unstable' package set
      unstableOverlay = (final: prev: {
        unstable = import nixpkgs-unstable {
          inherit (prev) system;
          config.allowUnfree = true;
        };
      });
    in {
      nixosConfigurations = {
        # Local workstation configuration
        local = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            { nixpkgs.overlays = [ unstableOverlay ]; }
            ./hosts/local.nix         # imports hardware, common, and local modules
            agenix.nixosModules.default
          ];
        };
        # Remote server configuration (placeholder)
        remote = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            { nixpkgs.overlays = [ unstableOverlay ]; }
            ./hosts/remote.nix        # imports hardware, common, and CLI modules
            agenix.nixosModules.default
          ];
        };
      };
      # DevShell providing agenix CLI for editing secrets
      devShells.${system}.default = nixpkgs.legacyPackages.${system}.mkShell {
        packages = [ agenix.packages.${system}.default ];
      };
  };
}
