{ pkgs, config, ... }:
{
  services.mpd = {
    enable = true;
    # startWhenNeeded = true;
    extraConfig = ''
      follow_outside_symlinks "yes"
      audio_output {
        type    "pulse"
        name    "pulseaudio"
        server  "localhost"
      }
    '';
  };

  sound.mediaKeys.enable = true;

  environment.systemPackages = with pkgs; [
    ncmpcpp mpc_cli
  ];
}
