{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.xserver.desktopManager.kodi2;
in

{
  options = {
    services.xserver.desktopManager.kodi2 = {
      enable = mkOption {
        default = false;
        description = "Enable the kodi multimedia center.";
      };
    };
  };

  config = mkIf cfg.enable {
    services.xserver.desktopManager.session = [{
      name = "kodi2";
      start = ''
        xrandr --output LVDS1 --off
        ${pkgs.i3}/bin/i3 &
        ${pkgs.kodi}/bin/kodi --lircdev /var/run/lirc/lircd --standalone &
        waitPID=$!
      '';
    }];

    environment.systemPackages = [ pkgs.kodi pkgs.i3 pkgs.google-chrome pkgs.xdotool ];
  };
}
