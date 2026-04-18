  # modules/packages/emulation.nix

  { inputs, ... }:
{
  flake.modules.nixos.emulation = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      dolphin-emu
      pcsx2
      rpcs3
      azahar
      retroarch-full
    ];

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
  };
}
