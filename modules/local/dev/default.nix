{ config, pkgs, ... }:

{
  imports = [
    ./python.nix
  ];

  environment.systemPackages = [
    # Use latest Zed editor from unstable package set
    # my main coding editor
    pkgs.unstable.zed-editor

    # well git has to be the VCS
    pkgs.gitFull
    pkgs.delta # nice diff viewer
  ];
}
