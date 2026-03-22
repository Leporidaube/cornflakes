  # modules/hosts/sier/audiofix.nix  

  { ... }:
{
  flake.modules.nixos.audiofix = { ... }: {

  # Disable monitor sinks
    environment.etc = {
      "wireplumber/wireplumber.conf.d/51-disable-monitor-sinks.conf".text = ''
        monitor.alsa.rules = [
          {
            matches = [
              { device.name = "alsa_card.pci-0000_03_00.1" }
            ]
            actions = {
              update-props = {
                device.profile = "output:hdmi-stereo"
              }
            }
          }
          {
            matches = [
              { device.name = "alsa_card.pci-0000_10_00.1" }
            ]
            actions = { update-props = { device.disabled = true } }
          }
          {
            matches = [
              { device.name = "alsa_card.pci-0000_10_00.6" }
            ]
            actions = { update-props = { device.disabled = true } }
          }
        ]

        default.configured-nodes = [
          {
            name = "alsa_output.pci-0000_03_00.1.hdmi-stereo"
            media.class = "Audio/Sink"
          }
        ]
      '';
    };
  };
}
