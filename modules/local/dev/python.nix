{ config, pkgs, ... }:

{
  environment.systemPackages = [
    # Will be used in Zed in the end
    pkgs.pyright
    pkgs.python3Packages.python-lsp-server
  ];
}
