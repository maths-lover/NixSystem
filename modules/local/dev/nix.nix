{ config, pkgs, ... }:

{
  environment.systemPackages = [
    # Will be used in Zed in the end
    pkgs.nil
    pkgs.nixd
  ];
}

