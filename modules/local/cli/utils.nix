{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.btop
    pkgs.wl-clipboard
    pkgs.fastfetch
    pkgs.zip
    pkgs.unzip
    pkgs.grim
  ];
}
