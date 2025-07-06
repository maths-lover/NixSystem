{ config, pkgs, lib, ... }:

{
  imports = [
    ../hardware-configuration.nix   # local machine hardware specifics
    ../modules/common/default.nix   # base system settings common to all hosts
    ../modules/local/default.nix    # workstation-specific modules (desktop, apps, etc.)
    ../modules/local/user.nix       # local user account and groups
  ];

  networking.hostName = "MCPLMUMLPTLEN32";
}
