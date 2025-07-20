{ config, pkgs, ... }:

{
  hardware = {
    # opentablet drivers are for my xp-pen mini 7 v2 as it supports it
    opentabletdriver.enable = true;

    # hardware acceleration
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
