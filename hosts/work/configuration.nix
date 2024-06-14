{ pkgs, pkgs-stable, ... }:

# ██     ██  ██████  ██████  ██   ██ 
# ██     ██ ██    ██ ██   ██ ██  ██  
# ██  █  ██ ██    ██ ██████  █████   
# ██ ███ ██ ██    ██ ██   ██ ██  ██  
#  ███ ███   ██████  ██   ██ ██   ██ 

{
  imports =
    [
      ../../hosts/work/hardware-configuration.nix
      ../../hardware/bluetooth.nix
      # ../../hardware/work_nvidia.nix
      ../../system/printers.nix
      ../../system/udev.nix
      ../../hardware/system76.nix
      ../../system/fonts.nix
      ../../system/gnome.nix
      ../../system/language_servers.nix
    ];

  # Needed to run swaylock
  security.pam.services.swaylock = {};

  # Gnome Keyring for Hyprland
  security.pam.services.login.enableGnomeKeyring = true;

  # Samba
  services.samba = {
    enable = true;
    openFirewall = true;
    securityType = "user";
    shares = {
      public = {
        path = "/home/hacky/syn_mov";
        "guest ok" = "yes";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
  networking.firewall.allowPing = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "jonix";
  networking.networkmanager.enable = true;
  services.openssh.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Fish 🐡
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  environment.shells = with pkgs; [ fish ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    # libinput.enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    # displayManager.lightdm.enable = true;
    # desktopManager = {
    #   cinnamon.enable = true;
    # };
    # displayManager.defaultSession = "cinnamon";
    videoDrivers = [ "amdgpu "];
  };

  # OPENCL
   hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages_5.clr.icd
      rocmPackages_5.clr
      rocmPackages_5.rocminfo
      rocmPackages_5.rocm-runtime
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

  #########

  programs.dconf.enable = true;
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
    autoconnect = ["qemu:///system"];
    uris = ["qemu:///system"];
    };
  };

  ## Enable
  programs.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland; 
  };

  # Cachix
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # Virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Printing
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.brlaser ];
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  
  ## Open Firewall Ports
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 9090 22 80 46745 ];
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  # Define a user account
  users.users.hacky = {
    isNormalUser = true;
    description = "hacky";
    extraGroups = [ "networkmanager" "wheel" "plugdev" "dialout" "libvirtd"];
    uid = 1000;
  };

  environment.systemPackages = 
  (with pkgs-stable; [
    cargo
    delve
    discord
    fish
    git
    home-manager
    go
    makemkv
    microsoft-edge-dev
    nil
    steam
    synology-drive-client
    vim
    wget
    wineWowPackages.stable
    zellij
    ])

  ++

  (with pkgs; [
    simplex-chat-desktop
    xmrig-mo
  ]);

  # System Version
  system.stateVersion = "24.05";

  # Nix Flakes ❄️
  nix.package= pkgs.nixFlakes;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
}
