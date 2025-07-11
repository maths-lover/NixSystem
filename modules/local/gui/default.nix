{ config, pkgs, ... }:

{
  environment.systemPackages = [
    # Note taking with obsidian
    pkgs.obsidian

    # Digital art
    pkgs.krita

    # Music
    pkgs.spotify

    # Screen recording
    pkgs.obs-studio
    pkgs.xdg-desktop-portal
    pkgs.xdg-desktop-portal-gtk

    # Communication apps
    pkgs.telegram-desktop
    pkgs.slack
    pkgs.unstable.zoom-us

    # Security tools
    pkgs.zenmap
  ];
}
