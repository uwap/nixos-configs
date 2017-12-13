{ config, pkgs, ... }:

with pkgs.lib;
{
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "de";
    defaultLocale = "de_DE.UTF-8";
  };

  time.timeZone = "Europe/Berlin";
  
  services.xserver.layout = mkIf config.services.xserver.enable "de";
}
