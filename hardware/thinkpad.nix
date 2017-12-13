{ config, pkgs, ... }:

{
  hardware.trackpoint = {
    enable = true;
    emulateWheel = true;
  };
}
