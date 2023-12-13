{ config, lib, pkgs, modulesPath, ... }:

# ██       █████  ██████  
# ██      ██   ██ ██   ██ 
# ██      ███████ ██████  
# ██      ██   ██ ██      
# ███████ ██   ██ ██      

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/316afb2e-984f-4ab9-ba01-e271f69ba0e4";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-65177d3d-f642-4f4b-b907-ac50ab9a3792".device = "/dev/disk/by-uuid/65177d3d-f642-4f4b-b907-ac50ab9a3792";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/B08D-FB78";
      fsType = "vfat";
    };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
