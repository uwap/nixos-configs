# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.luks.devices = { crypt = {
    # name = "crypt";
    device = "/dev/disk/by-uuid/b73d7f6c-2950-4efa-982d-e290ecc94c66";
    allowDiscards = true;
    preLVM = true;
  };};
  boot.initrd.availableKernelModules = [ "ehci_pci" "ahci" "usb_storage" "sd_mod" "sr_mod" "sdhci_pci" "xhci_hcd" ];
  boot.kernelModules = [ "kvm-intel" "dm_snapshot" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/mapper/t520-root";
      fsType = "ext4";
      options = ["noatime" "nodiratime" "discard"];
    };

  fileSystems."/home" =
    { device = "/dev/mapper/t520-home";
      fsType = "ext4";
      options = ["noatime" "nodiratime" "discard"];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/1007bd5c-b0a9-44d0-af43-10416e57e314";
      fsType = "ext4";
      options = ["noatime" "nodiratime" "discard"];
    };

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 8;
}
