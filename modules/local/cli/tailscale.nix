{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.tailscale
  ];

  # we'll need the secret to auth tailscale
  age.secrets.tailscale_secret.file = ../../../secrets/tailscale_secret.age;

  services.tailscale = {
    enable = true;
    # openFirewall = true;
    authKeyFile = config.age.secrets.tailscale_secret.path;
    extraUpFlags = [
      "--ssh"
      "--hostname=${config.networking.hostName}"
    ];
  };
}
