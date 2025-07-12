{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.btop
    pkgs.wl-clipboard
    pkgs.fastfetch
    pkgs.zip
    pkgs.unzip

    # screenshot
    pkgs.grim
    pkgs.slurp
  ];
}
