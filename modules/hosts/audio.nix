  # /modules/hosts/audio.nix

  { ... }: 
{
  flake.modules.nixos.audio = { ... }: {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      jack.enable = false;
    };

    # Disable PulseAudio    
    services.pulseaudio.enable = false;

    # Audio optimization
    security.rtkit.enable = true;

    # MPRIS
    services.playerctld.enable = true;
    
  };
}
