{ config, pkgs, ... }:

{
  imports = [
    ./desktop
    ./cli
    ./gui
    ./dev
    ./gaming
    ./virtualization
    ./misc
  ];
}

