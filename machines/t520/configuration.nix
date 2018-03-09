# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ../../client.nix
      ../../hardware/thinkpad.nix
      ../../users/uwap.nix
      ../../locales/de.nix
      ../../games.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.configurationLimit = 3;

  networking.hostName = "uwap-t520";
  networking.networkmanager.enable = true;

  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  hardware.bluetooth.enable = true;
  
  services.xserver.videoDrivers = [ "nvidia" ];

  networking.firewall.enable = false;

  programs.light.enable = true;

  security.pam.enableU2F = true;

  nixpkgs.config.wine = {
    release = "stable";
    build = "wine64";
    pulseaudioSupport = true;
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      dejavu_fonts
      powerline-fonts
      ubuntu_font_family
    ];
  };
}
