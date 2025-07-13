{ pkgs, ... }:

{
  services.udev = {
    packages = [
      pkgs.qmk
      pkgs.qmk-udev-rules # the only relevant
      pkgs.qmk_hid
    ];
  };
}
