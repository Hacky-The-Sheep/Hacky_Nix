{ pkgs, ...}:

{
  boot.initrd.kernelModules = [ "amdgpu" ];

  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable MSR Mod
  hardware.cpu.x86.msr.enable = true;

  # OpenCL
  hardware.opengl.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];
}
