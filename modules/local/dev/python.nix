{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.python313Full
  ];
}
