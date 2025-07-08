{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./niri.nix
  ];

  environment.systemPackages = [
    pkgs.xwayland-satellite # putting this here as many apps are dependent on xwayland to run properly like slack.
  ];
}


