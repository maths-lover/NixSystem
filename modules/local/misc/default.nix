{ config, pkgs, ... }:

{
  imports = [
    ./fonts.nix

    ./drivers.nix
  ];
}
