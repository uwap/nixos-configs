{ config, pkgs, ... }:

{
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    support32Bit = true;
    zeroconf = {
      discovery.enable = true;
    };
    tcp = {
      enable = true;
      anonymousClients = {
        allowedIpRanges = [ "172.0.0.1" "::1" ];
      };
    };
  };

  environment.systemPackages = with pkgs; [ pavucontrol pamixer ];
}
