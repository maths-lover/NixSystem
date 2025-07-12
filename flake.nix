{
  description = "NixOS 25.05 flake (multi-host, modular)";
  inputs = {
    # Use NixOS 25.05 stable and NixOS unstable for latest packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Flake: agenix for secrets
    agenix.url = "github:ryantm/agenix";

    # Flake: niri window manager
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";   # build against 25.05
    };

    # Flake: quickshell
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Flake: nix-ld
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, ... } @ inputs:
    let
      system = "x86_64-linux";
      # Overlay to include unstable nixpkgs as an 'unstable' package set
      unstableOverlay = (final: prev: {
        unstable = import nixpkgs-unstable {
          inherit (prev) system;
          config.allowUnfree = true;
        };
      });

      agenix = inputs.agenix;
      niri = inputs.niri;
      nix-ld = inputs.nix-ld;
    in {
      nixosConfigurations = {

        #################################
        # Local workstation configuration
        #################################
        local = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            {
              nixpkgs.overlays = [
                unstableOverlay
                niri.overlays.niri
              ];
            }
            ./hosts/local.nix         # imports hardware, common, and local modules
            agenix.nixosModules.default
            nix-ld.nixosModules.nix-ld
            { programs.nix-ld.dev.enable = true; }
          ];
        };

        ###########################################
        # Remote server configuration (placeholder)
        ###########################################
        remote = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            { nixpkgs.overlays = [ unstableOverlay ]; }
            ./hosts/remote.nix        # imports hardware, common, and CLI modules
            agenix.nixosModules.default
          ];
        };
      };

      ###################################################
      # DevShell providing agenix CLI for editing secrets
      ###################################################
      devShells.${system}.default = nixpkgs.legacyPackages.${system}.mkShell {
        packages = [ agenix.packages.${system}.default ];
      };
  };
}
