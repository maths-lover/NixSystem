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

    # aws cli 2, as I work with it
    pkgs.awscli2
  ];
}
