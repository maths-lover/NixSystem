{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.fuzzel
  ];
}

