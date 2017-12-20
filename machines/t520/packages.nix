{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; with haskellPackages; [
    wget
    git
    firefox
    xfce.terminal
    xfce.xfce4-screenshooter
    thunderbird
    libreoffice
    gnupg
    pass
    texlive.combined.scheme-full
    oraclejre8
    vlc
    chromium
    acpi
    cabal-install ghc cabal2nix
  ];

  nixpkgs.config.allowUnfree = true;
}
