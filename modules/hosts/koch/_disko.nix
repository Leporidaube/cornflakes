  # modules/hosts/koch/_disko.nix

{ ... }:
  {
    disko.devices = {
      disk.main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            swap = {
              size = "32G";
              content = {
                type = "swap";
              };
            };
            root = {
              size = "1430G";
              content = {
                type = "luks";
                name = "cryptroot";
                content = {
                  type = "filesystem";
                  format = "btrfs";
                  mountpoint = "/";
                };
              };
            };
          };
        };
      };
    };
  }
