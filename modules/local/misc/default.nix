{ config, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./drivers.nix
    ./udev_rules.nix
  ];
}
