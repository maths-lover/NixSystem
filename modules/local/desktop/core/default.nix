{ config, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./browser.nix
    ./terminal.nix
    ./launcher.nix
    ./locker.nix
  ];
}

