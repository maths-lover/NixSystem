{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.nerd-fonts.martian-mono
    pkgs.nerd-fonts.inconsolata
    pkgs.nerd-fonts.iosevka
    pkgs.nerd-fonts.iosevka-term
    pkgs.nerd-fonts.zed-mono
    pkgs.nerd-fonts.code-new-roman
  ];
}

