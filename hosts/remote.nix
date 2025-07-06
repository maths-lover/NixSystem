{ config, pkgs, lib, ... }:

{
  imports = [
    ./remote-hardware.nix           # remote server hardware config (placeholder)
    ../modules/common/default.nix   # base system settings
    ../modules/local/cli/default.nix  # reuse CLI tool configuration (shell, tailscale)
  ];

  networking.hostName = "remote-server";

  # Define a user on the remote (for SSH and administrative access)
  users.users.surajp = {
    isNormalUser = true;
    description = "Suraj (remote)";
    extraGroups = [ "wheel" ];   # allow sudo
    # Note: no autologin on the server
  };

  # Enable SSH server for remote management
  services.openssh.enable = true;
}
