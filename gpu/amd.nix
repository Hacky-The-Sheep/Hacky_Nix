{ pkgs, ...}:

{
  boot.initrd.kernelModules = [ "amdgpu" ];

  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable MSR Mod
  hardware.cpu.x86.msr.enable = true;

  # OpenCL
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
    rocmPackages.clr.icd
    ];
  };

  # This is necesery because many programs hard-code the path to hip
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages_5.clr}"
  ];

  environment.variables = {
    # As of ROCm 4.5, AMD has disabled OpenCL on Polaris based cards. So this is needed if you have a 500 series card. 
    ROC_ENABLE_PRE_VEGA = "1";
  };
}
