{ pkgs, ... }:

{
  programs.niri.package = pkgs.niri-unstable;
  programs.niri.enable = true;
}

# vim: ts=2 sts=2 sw=2 et
