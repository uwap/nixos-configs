{ config, pkgs, ... }:

{
  users.extraUsers.uwap = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = with pkgs.lib;
      [ "wheel" ]
      ++ optional config.networking.networkmanager.enable "networkmanager";
    shell = pkgs.fish;
  };
}
