{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.floorp         # Floorp web browser (Firefox-based)
    pkgs.google-chrome  # Google Chrome browser
    pkgs.browsers       # To open links in correct browser
  ];
}
