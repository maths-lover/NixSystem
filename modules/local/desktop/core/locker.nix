{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.hyprlock
  ];
}
