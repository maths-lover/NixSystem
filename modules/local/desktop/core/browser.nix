{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.floorp         # Floorp web browser (Firefox-based)
    pkgs.google-chrome  # Google Chrome browser
    pkgs.zen-browser    # my custom zen browser flake from overlays
    pkgs.browsers       # To open links in correct browser

    # media codecs for firefox based browsers
    pkgs.mediastreamer-openh264
    pkgs.ffmpeg-full
    pkgs.gst_all_1.gstreamer
    pkgs.gst_all_1.gst-plugins-base
    pkgs.gst_all_1.gst-plugins-good
    pkgs.gst_all_1.gst-plugins-bad
    pkgs.gst_all_1.gst-plugins-ugly
    pkgs.gst_all_1.gst-libav
    pkgs.gst_all_1.gst-vaapi
  ];
}
