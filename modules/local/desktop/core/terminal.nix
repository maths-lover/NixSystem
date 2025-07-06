{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.kitty    # Kitty terminal emulator
  ];
}
