{ pkgs, lib, config, ... }:

{
  # screeps requires gtk3.
  # Wait for https://github.com/NixOS/nixpkgs/issues/32881 to get fixed
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        # gtk3 required by screeps
        gnome3.gtk
        zlib
        dbus
        freetype
        glib
        atk
        cairo
        gdk_pixbuf
        pango
        fontconfig
        xorg.libxcb
        libudev
      ];
    };
  };   

  environment.systemPackages = with pkgs; [
    minecraft
    steam
    steam-run
  ];

  hardware.opengl.driSupport32Bit = true;
}
