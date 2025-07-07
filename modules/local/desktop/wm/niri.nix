{ config, pkgs, ... }:

{
  programs.niri.package = pkgs.niri-unstable;
  programs.niri.enable = true;

  #programs.niri.settings = {
  #  binds = {
  #    "Mod+Return".action.spawn = "kitty";

  #    # navigate workspaces
  #    "Mod+1".action.focus-workspace = 1;
  #    "Mod+2".action.focus-workspace = 2;
  #    "Mod+3".action.focus-workspace = 3;
  #    "Mod+4".action.focus-workspace = 4;
  #    "Mod+5".action.focus-workspace = 5;

  #    # Exit Niri
  #    "Mod+Shift+E".action.quit.skip-confirmation = true;

  #    # Media binds
  #    "XF86AudioRaiseVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"];
  #    "XF86AudioLowerVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"];
  #    "XF86AudioMute".action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
  #  };

  #  outputs."eDP-1".scale = 1.0;
  #};
}

# vim: ts=2 sts=2 sw=2 et
