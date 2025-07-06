{ config, pkgs, ... }:

{
  # Allow unfree packages system-wide
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    pkgs.neovim   # main editor
    pkgs.curl     # basic networking tools
    pkgs.file     # file utility
  ];

  # (Other system-wide programs can be enabled here as needed)
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # services.openssh.enable = true;
}
