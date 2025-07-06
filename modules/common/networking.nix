{ config, pkgs, ... }:

{
  # Host-specific hostname is set in each host's config
  # Configure networking and firewall settings:
  # (Wireless and Bluetooth network handled via NetworkManager with iwd backend)
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    IPv6 = { Enabled = true; };
    Settings = {
      AutoConnect = true;
      AddressRandomization = "persistent";
    };
  };
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  # Firewall configuration
  networking.nftables.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 80 443 ];
  networking.firewall.allowedUDPPorts = [ 53 ];
}

