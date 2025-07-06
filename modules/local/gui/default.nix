{ config, pkgs, ... }:

{
  environment.systemPackages = [
    # Digital art
    pkgs.krita

    # Music
    pkgs.spotify

    # Screen recording
    pkgs.obs-studio

    # Communication apps
    pkgs.telegram-desktop
    pkgs.slack
    pkgs.zoom-us

    # Security tools
    pkgs.zenmap
  ];
}
