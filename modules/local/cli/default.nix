{ config, pkgs, ... }:

{
  imports = [
    ./tailscale.nix
    ./shell.nix
    ./utils.nix
  ];
}
