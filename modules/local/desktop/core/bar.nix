{ config, pkgs, ... }:

{
  environment.systemPackages = [
    quickshell.packages.<system>.default
  ];
}
