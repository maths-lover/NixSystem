{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.mako
    pkgs.libnotify
  ];
}
