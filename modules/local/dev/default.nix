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
    # nice diff viewer
    pkgs.delta

    # required for Zed settings and JSON in general
    pkgs.unstable.vscode-json-languageserver
  ];
}
