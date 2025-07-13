{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.swaylock
  ];
}
