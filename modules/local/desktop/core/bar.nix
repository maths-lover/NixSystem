{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.unstable.quickshell
  ];
}
