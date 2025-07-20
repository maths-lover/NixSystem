{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.floorp         # Floorp web browser (Firefox-based)
    pkgs.google-chrome  # Google Chrome browser
    pkgs.zen-browser    # my custom zen browser flake
    pkgs.browsers       # To open links in correct browser

    pkgs.mediastreamer-openh264 # media codecs for firefox
  ];
}
