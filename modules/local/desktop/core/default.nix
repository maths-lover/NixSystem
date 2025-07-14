{ config, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./bar.nix
    ./bluetooth.nix
    ./browser.nix
    ./terminal.nix
    ./launcher.nix
    ./locker.nix
    ./cursor.nix
    ./notification.nix
    ./theme.nix
  ];
}

