{ config, ... }:

{
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableKvm = false;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.guest.clipboard = true;

  users.extraGroups.vboxusers.members = [ "surajp" ];
}
