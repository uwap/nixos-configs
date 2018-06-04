{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    exportConfiguration = true;

    dpi = 100;

    # input
    libinput = {
      enable = true;
      tapping = false;
      accelSpeed = "0.1";
    };
    multitouch.enable = true;

    # window manager (xmonad)
    windowManager.default = "xmonad";
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };

    # auto start x
    displayManager.auto = with pkgs.lib; mkIf (length (attrValues config.boot.initrd.luks.devices) > 0) {
      enable = true;
      user = "uwap";
    };
    desktopManager.default = "none";
    desktopManager.xterm.enable = false;

    xkbOptions = "compose:menu";
  };

  # xmonad dependencies
  environment.systemPackages = with pkgs; [
    haskellPackages.xmonad
    haskellPackages.xmobar
    xtrlock-pam
    xfce.xfce4-screenshooter
    vlc
    dzen2
    conky
    kbdKeymaps.dvp
    xdotool
    feh
  ];

  services.redshift = lib.mkDefault {
    enable = true;
    latitude = "49.4883333";
    longitude = "8.4647222";
    brightness.night = "0.5";
  };

  services.compton = {
    enable = true;
    backend = "glx";
    shadow = true;
    fade = true;
    vSync = "opengl-swc";
    activeOpacity = "1";
    inactiveOpacity = "0.85";
    opacityRules = [
      "99:class_g = 'vlc'"
      "99:_NET_WM_STATE@[0]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "99:_NET_WM_STATE@[1]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "99:_NET_WM_STATE@[2]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "99:_NET_WM_STATE@[3]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "99:_NET_WM_STATE@[4]:32a = '_NET_WM_STATE_FULLSCREEN'"
    ];
  };
}
