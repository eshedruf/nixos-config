{ config, pkgs, ... }:

{
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # further pipewire configuration as in your original file (if there are sub-attributes, they live here)
    };
}

