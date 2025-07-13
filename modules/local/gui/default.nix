{ config, pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
  };

  environment.systemPackages = [
    # via for keychron Q1 Pro
    pkgs.unstable.via

    # neovim gui editor
    pkgs.neovide

    # Note taking with obsidian
    pkgs.obsidian

    # Digital art
    pkgs.krita

    # simple image viewer
    pkgs.imv

    # Music
    pkgs.spotify
    pkgs.playerctl

    # Screen recording
    pkgs.obs-studio
    pkgs.xdg-desktop-portal
    pkgs.xdg-desktop-portal-gtk

    # Communication apps
    pkgs.telegram-desktop
    pkgs.slack
    pkgs.unstable.zoom-us
    pkgs.discord

    # Security tools
    pkgs.zenmap

    # pdf reader
    pkgs.zathura
  ];
}
