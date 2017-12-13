{ config, pkgs, ... }:

{
  imports = [
    ./audio/pulseaudio.nix
    ./audio/mpd.nix
    ./shell/fish.nix
    ./vim/configuration.nix
    ./x11
  ];
}
