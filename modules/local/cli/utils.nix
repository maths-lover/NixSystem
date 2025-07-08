{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.btop
    pkgs.wl-clipboard
    pkgs.fastfetch
  ];
}
