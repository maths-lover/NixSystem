{ config, pkgs, ... }:

{
  imports = [
    ./system.nix
    ./networking.nix
    ./core_packages.nix
  ];
}

