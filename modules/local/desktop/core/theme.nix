{ pkgs, ... }:

{
  environment.systemPackages = [
    # to set wallpaper
    pkgs.swww

    # to get colors from matugen
    pkgs.matugen
  ];
}
