{ config, ...}:

{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  ## Load drivers for Wayland
  services.xserver.videoDrivers = [ "nvidia" "modesetting" ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaPersistenced = true;
    nvidiaSettings = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    prime = {
      offload.enable = true;
      amdgpuBusId = "PCI:11:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
