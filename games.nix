{ pkgs, lib, config, ... }:

{
  # screeps requires gtk3.
  # Wait for https://github.com/NixOS/nixpkgs/issues/32881 to get fixed
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        # gtk3 required by screeps
        gnome3.gtk
      ];
    };
  };   

  environment.systemPackages = with pkgs; [
    minecraft
    steam
    steam-run
  ];
}
