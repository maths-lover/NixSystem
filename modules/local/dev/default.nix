{ pkgs, ... }:

{
  imports = [
    ./zeditor.nix
    ./docker.nix
    ./virtualbox.nix
  ];

  environment.systemPackages = [
    # well git has to be the VCS
    pkgs.gitFull
    # nice diff viewer
    pkgs.delta

    # for wakapi/wakatime
    pkgs.wakatime-cli

    # for api testing
    pkgs.hoppscotch
  ];
}
