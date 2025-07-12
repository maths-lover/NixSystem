{ pkgs, ... }:

{
  programs.nix-ld.libraries = [
    pkgs.stdenv.cc.cc                # libstdc++, libgcc_s
    pkgs.libGL                       # OpenGL / Mesa
    pkgs.libglvnd
    pkgs.libxkbcommon
    pkgs.wayland
    pkgs.xorg.libX11
    pkgs.xorg.libXi
    pkgs.xorg.libXcursor
    pkgs.xorg.libXrandr
    pkgs.xorg.libXxf86vm
    pkgs.xorg.libxcb
    pkgs.xorg.libXdamage
    pkgs.xorg.libXext
    pkgs.dbus
    pkgs.gdk-pixbuf
    pkgs.glib
    pkgs.gtk3
    pkgs.alsa-lib
    pkgs.libpulseaudio              # sound in previews
    pkgs.fontconfig
    pkgs.freetype
    pkgs.expat
    pkgs.zlib
  ];
  environment.systemPackages = [
    # Use latest Zed editor from unstable package set
    # my main coding editor
    pkgs.unstable.zed-editor
  ];
}
