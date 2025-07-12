{ config, pkgs, ... }:

{
  environment.systemPackages = [
    # Osu!
    pkgs.osu-lazer-bin

    # For minecraft
    pkgs.lunar-client
  ];
}
