{ config, pkgs, ... }:

{
  # Define the primary local user account
  users.users.surajp = {
    isNormalUser = true;
    description = "Suraj Pal Singh";
    extraGroups = [ "networkmanager" "wheel" ];  # enable sudo and network control
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
    # passwordFile = config.age.secrets.tailscale_secret.path;
  };

  # Enable auto-login on TTY for the local user
  services.getty.autologinUser = "surajp";

  age.identityPaths = [ "/home/surajp/.ssh/id_ed25519" ];
}
