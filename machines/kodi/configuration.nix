# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ../../client.nix
      ../../locales/de.nix
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "uwap-kodi"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "de";
    defaultLocale = "de_DE.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  services.redshift.enable = false;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    wget vim steam wmctrl kodi firefox xdotool git
  ];
  nixpkgs.config.allowUnfree = true;

  hardware.pulseaudio = {
    zeroconf = {
      discovery.enable = true;
      publish.enable = true;
    };
  };


  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  networking.firewall = {
    allowPing = true;
    allowedTCPPorts = [ 80 8080 ];
    rejectPackets = true;
    extraCommands = "iptables -A PREROUTING -t nat -p tcp --dport 80 -j REDIRECT --to-port 8080"; 
  };

  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "de";
    videoDrivers = [ "intel" ];
    displayManager.slim = {
      enable = true;
      defaultUser = "kodi";
    };
    desktopManager.steam.enable = true;
    desktopManager.kodi.enable = true;
    windowManager.xmonad.enable = false;
  };
  hardware.opengl.driSupport32Bit = true;
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  # services.xserver.windowManager.i3.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.kodi = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";

}
