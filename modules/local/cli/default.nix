{ config, pkgs, ... }:

{
  imports = [
    ./tailscale.nix
    ./shell.nix
  ];
}
