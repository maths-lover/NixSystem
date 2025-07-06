{ config, pkgs, ... }:

{
  environment.systemPackages = [
    # user shell
    pkgs.zsh

    # Tools required for the Zsh + starship prompt setup
    pkgs.eza
    pkgs.ripgrep
    pkgs.fd
    pkgs.fzf
    pkgs.fzf-git-sh
    pkgs.starship
    pkgs.bat
  ];

  programs.zsh.enable = true;
}

